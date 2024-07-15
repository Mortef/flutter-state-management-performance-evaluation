import 'package:get/get.dart';

class CounterController extends GetxController {
  var counter = 0.obs;
  var milliseconds = 0.obs;
  var isMilestoneReached = false.obs;

  void _incrementCounter() => counter++;

  Future<void> loopAmount(int amount) async {
    final stopwatch = Stopwatch()..start();

    counter.value = 0;
    milliseconds.value = 0;

    for (var i = 0; i < amount; i++) {
      _incrementCounter();
      await Future.delayed(Duration.zero);

      if (counter.value % 5000 == 0 && counter.value != 0) {
        isMilestoneReached.value = !isMilestoneReached.value;
      }
    }

    stopwatch.stop();
    milliseconds.value = stopwatch.elapsedMilliseconds;
  }
}
