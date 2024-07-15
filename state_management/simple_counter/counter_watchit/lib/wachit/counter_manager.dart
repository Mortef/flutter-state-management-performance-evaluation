import 'package:flutter/material.dart';

class CounterManager {
  ValueNotifier<int> counter = ValueNotifier(0);
  ValueNotifier<int> milliseconds = ValueNotifier(0);

  Future<void> loop(int amount) async {
    final stopwatch = Stopwatch()..start();

    counter.value = 0;
    milliseconds.value = 0;

    for (var i = 0; i < amount; i++) {
      counter.value++;
      await Future.delayed(Duration.zero);
    }

    stopwatch.stop();
    milliseconds.value = stopwatch.elapsedMilliseconds;
  }
}
