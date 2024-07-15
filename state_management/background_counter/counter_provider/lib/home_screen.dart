import 'package:counter_provider/helpers/counter_material.dart';
import 'package:counter_provider/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => runAfterBuildComplete());
  }

  void runAfterBuildComplete() async {
    final counterProvider = context.read<CounterProvider>();

    // This constants are used to pass the values from the python script
    const warmUpAmount = int.fromEnvironment('WARM_UP_COUNT', defaultValue: 0);
    const loopAmount = int.fromEnvironment('LOOP_AMOUNT', defaultValue: 0);
    const countAmount = int.fromEnvironment('COUNT_AMOUNT', defaultValue: 0);

    for (var i = 0; i < 10; i++) {
      await counterProvider.loop(warmUpAmount);
    }
    for (var i = 0; i < loopAmount; i++) {
      await counterProvider.loop(countAmount);

      // This print is used by the python script to collect the data
      // ignore: avoid_print
      print('Total time: ${counterProvider.milliseconds} ms');
    }

    // This print is used by the python script to know when to stop the app
    // ignore: avoid_print
    print('All jobs finished');
  }

  @override
  Widget build(BuildContext context) {
    final children = [
      const _CounterText(),
      const _InputWidget(),
      const _MsText(),
    ];

    final content = Stack(
      children: [
        const _Background(),
        CounterMaterial(children: children),
      ],
    );

    return content;
  }
}

class _InputWidget extends StatefulWidget {
  const _InputWidget();

  @override
  State<_InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<_InputWidget> {
  final textController = TextEditingController(text: '10000');

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final counterProvider = context.read<CounterProvider>();
    const buttonText = Text('Loop');

    final textField = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: TextField(
        controller: textController,
        decoration: const InputDecoration(
          labelText: 'Enter loop count amount',
        ),
        keyboardType: TextInputType.number,
      ),
    );

    void onPressed() {
      final number = int.tryParse(textController.text) ?? 0;
      counterProvider.loop(number);
    }

    final loopButton = ElevatedButton(onPressed: onPressed, child: buttonText);

    return Column(
      children: [
        textField,
        const SizedBox(height: 16),
        loopButton,
      ],
    );
  }
}

class _CounterText extends StatelessWidget {
  const _CounterText();
  @override
  Widget build(BuildContext context) {
    final counter = context.select((CounterProvider p) => p.counter);
    return Text(
      'Loop count: $counter',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}

class _MsText extends StatelessWidget {
  const _MsText();
  @override
  Widget build(BuildContext context) {
    final milliseconds = context.select((CounterProvider p) => p.milliseconds);
    if (milliseconds == 0) return const SizedBox.shrink();
    return Text('Elapsed time: $milliseconds ms');
  }
}

class _Background extends StatelessWidget {
  const _Background();

  @override
  Widget build(BuildContext context) {
    final isOther = context.select((CounterProvider p) => p.isMilestoneReached);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    const numberOfPieces = 1000;

    Widget buildPiecePart(Color? color) {
      return Container(
        width: screenWidth / 2,
        height: screenHeight / numberOfPieces,
        color: color,
      );
    }

    final firstPieceColor =
        isOther ? Colors.blueAccent[100] : Colors.blueGrey[100];
    final secondPieceColor =
        isOther ? Colors.blueAccent[200] : Colors.blueGrey[200];

    Widget buildPieceRow(Color? firstPieceColor, Color? secondPieceColor) {
      return Row(
        children: [
          buildPiecePart(firstPieceColor),
          buildPiecePart(secondPieceColor),
        ],
      );
    }

    List<Widget> buildBackground() {
      final background = <Widget>[];
      for (var i = 0; i < numberOfPieces; i++) {
        if (i.isEven) {
          background.add(buildPieceRow(firstPieceColor, secondPieceColor));
        } else {
          background.add(buildPieceRow(secondPieceColor, firstPieceColor));
        }
      }
      return background;
    }

    return Column(children: buildBackground());
  }
}
