import 'package:counter_getx/getx/counter_controller.dart';
import 'package:counter_getx/helpers/counter_material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(CounterController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => runAfterBuildComplete());
  }

  void runAfterBuildComplete() async {
    // This constants are used to pass the values from the python script
    const warmUpAmount = int.fromEnvironment('WARM_UP_COUNT', defaultValue: 0);
    const loopAmount = int.fromEnvironment('LOOP_AMOUNT', defaultValue: 0);
    const countAmount = int.fromEnvironment('COUNT_AMOUNT', defaultValue: 0);

    for (var i = 0; i < 10; i++) {
      await controller.loopAmount(warmUpAmount);
    }
    for (var i = 0; i < loopAmount; i++) {
      await controller.loopAmount(countAmount);

      // This print is used by the python script to collect the data
      // ignore: avoid_print
      print('Total time: ${controller.milliseconds.value} ms');
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
    return CounterMaterial(children: children);
  }
}

class _InputWidget extends StatefulWidget {
  const _InputWidget();

  @override
  State<_InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<_InputWidget> {
  final CounterController controller = Get.find();
  final textController = TextEditingController(text: '10000');

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
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
      controller.loopAmount(number);
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
    final CounterController controller = Get.find();
    return Obx(() {
      final counter = controller.counter.value;
      return Text(
        'Loop count: $counter',
        style: Theme.of(context).textTheme.headlineMedium,
      );
    });
  }
}

class _MsText extends StatelessWidget {
  const _MsText();
  @override
  Widget build(BuildContext context) {
    final CounterController controller = Get.find();
    return Obx(() {
      final milliseconds = controller.milliseconds.value;
      if (milliseconds == 0) return const SizedBox.shrink();
      return Text('Elapsed time: $milliseconds ms');
    });
  }
}
