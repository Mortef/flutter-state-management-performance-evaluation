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

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  Future<void> loopAmount(int amount, {bool isWarmUp = false}) async {
    final stopwatch = Stopwatch()..start();

    counter = 0;
    milliseconds = 0;

    for (var i = 0; i < amount; i++) {
      setState(() => counter++);
      await Future.delayed(Duration.zero);
    }

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

    return CounterMaterial(children: children);
  }
}
