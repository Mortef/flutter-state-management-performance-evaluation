import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int counter = 0;
  int milliseconds = 0;

  Future<void> loop(int amount) async {
    final stopwatch = Stopwatch()..start();
    counter = 0;
    milliseconds = 0;
    for (var i = 0; i < amount; i++) {
      counter++;
      await Future.delayed(Duration.zero);
      notifyListeners();
    }
    stopwatch.stop();
    milliseconds = stopwatch.elapsedMilliseconds;
    notifyListeners();
  }
}
