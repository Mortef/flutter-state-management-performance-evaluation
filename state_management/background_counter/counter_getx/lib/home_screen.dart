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

class _Background extends StatelessWidget {
  const _Background();

  @override
  Widget build(BuildContext context) {
    final CounterController controller = Get.find();
    return Obx(() {
      final isOther = controller.isMilestoneReached.value;
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
    });
  }
}
