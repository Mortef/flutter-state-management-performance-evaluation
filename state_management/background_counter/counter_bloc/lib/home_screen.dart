import 'package:counter_bloc/bloc/counter_bloc.dart';
import 'package:counter_bloc/helpers/counter_material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  CounterState get state => context.read<CounterBloc>().state;

  void runAfterBuildComplete() async {
    // This constants are used to pass the values from the python script
    const warmUpAmount = int.fromEnvironment('WARM_UP_COUNT', defaultValue: 0);
    const loopAmount = int.fromEnvironment('LOOP_AMOUNT', defaultValue: 0);
    const countAmount = int.fromEnvironment('COUNT_AMOUNT', defaultValue: 0);

    final counterBloc = context.read<CounterBloc>();

    for (var i = 0; i < 10; i++) {
      counterBloc.add(const CounterEvent.loopAmount(warmUpAmount));
      await counterBloc.stream.firstWhere((s) => s.counter == warmUpAmount);
    }
    for (var i = 0; i < loopAmount; i++) {
      counterBloc.add(const CounterEvent.loopAmount(countAmount));
      final stream = counterBloc.stream;

      // Wait for the counter to finish counting
      await stream.firstWhere((s) => s.counter == countAmount);

      // This print is used by the python script to collect the data
      // ignore: avoid_print
      print('Total time: ${state.milliseconds} ms');
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
  State<_InputWidget> createState() => __InputWidgetState();
}

class __InputWidgetState extends State<_InputWidget> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: '10000');
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const buttonText = Text('Loop');

    final textField = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(
          labelText: 'Enter loop count amount',
        ),
        keyboardType: TextInputType.number,
      ),
    );

    void onPressed() {
      final number = int.tryParse(controller.text) ?? 0;
      context.read<CounterBloc>().add(CounterEvent.loopAmount(number));
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
    return BlocSelector<CounterBloc, CounterState, int>(
      selector: (s) => s.counter,
      builder: (context, counter) {
        return Text(
          'Loop count: $counter',
          style: Theme.of(context).textTheme.headlineMedium,
        );
      },
    );
  }
}

class _MsText extends StatelessWidget {
  const _MsText();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CounterBloc, CounterState, int>(
      selector: (s) => s.milliseconds,
      builder: (context, milliseconds) {
        if (milliseconds == 0) return const SizedBox.shrink();
        return Text('Elapsed time: $milliseconds ms');
      },
    );
  }
}

class _Background extends StatelessWidget {
  const _Background();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CounterBloc, CounterState, bool>(
      selector: (s) => s.isMilestoneReached,
      builder: (context, isMilestoneReached) {
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
            isMilestoneReached ? Colors.blueAccent[100] : Colors.blueGrey[100];
        final secondPieceColor =
            isMilestoneReached ? Colors.blueAccent[200] : Colors.blueGrey[200];

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
      },
    );
  }
}
