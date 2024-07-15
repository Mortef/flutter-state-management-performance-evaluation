import 'package:counter_set_state/helpers/counter_material.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;
  int milliseconds = 0;
  bool isOther = false;
  final textController = TextEditingController(text: '10000');

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => runAfterBuildComplete());
  }

  void runAfterBuildComplete() async {
    // This constants are used to pass the values from the python script
    const warmUpAmount = int.fromEnvironment('WARM_UP_COUNT', defaultValue: 0);
    const loopAmountV = int.fromEnvironment('LOOP_AMOUNT', defaultValue: 0);
    const countAmount = int.fromEnvironment('COUNT_AMOUNT', defaultValue: 0);
    for (var i = 0; i < 10; i++) {
      await loopAmount(warmUpAmount, isWarmUp: true);
    }
    for (var i = 0; i < loopAmountV; i++) {
      await loopAmount(countAmount);
    }

    // This print is used by the python script to know when to stop the app
    // ignore: avoid_print
    print('All jobs finished');
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  Future<void> loopAmount(int amount, {bool isWarmUp = false}) async {
    final stopwatch = Stopwatch()..start();

    counter = 0;
    milliseconds = 0;

    for (var i = 0; i < amount; i++) {
      setState(() => counter++);
      if (counter % 5000 == 0) isOther = !isOther;
      await Future.delayed(Duration.zero);
    }

    await Future.delayed(Duration.zero);

    stopwatch.stop();
    final elapsedTime = stopwatch.elapsedMilliseconds;

    // This print is used by the python script to collect the data
    // ignore: avoid_print
    if (!isWarmUp) print('Total time: $elapsedTime ms');
    setState(() => milliseconds = elapsedTime);
  }

  @override
  Widget build(BuildContext context) {
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
      loopAmount(number);
    }

    final loopButton = ElevatedButton(onPressed: onPressed, child: buttonText);

    final counterText = Text(
      'Loop count: $counter',
      style: Theme.of(context).textTheme.headlineMedium,
    );

    final inputWidget = Column(
      children: [
        textField,
        const SizedBox(height: 16),
        loopButton,
      ],
    );

    final msText = Text('Elapsed time: $milliseconds ms');

    final children = [
      counterText,
      inputWidget,
      if (milliseconds != 0) msText,
    ];
    final content = Stack(
      children: [
        _Background(isOther: isOther),
        CounterMaterial(children: children),
      ],
    );

    return content;
  }
}

class _Background extends StatelessWidget {
  const _Background({this.isOther = false});

  final bool isOther;

  @override
  Widget build(BuildContext context) {
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
