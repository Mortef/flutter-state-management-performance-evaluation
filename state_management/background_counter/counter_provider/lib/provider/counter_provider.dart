import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int counter = 0;
  int milliseconds = 0;
  bool isMilestoneReached = false;

  Future<void> loop(int amount) async {
    final stopwatch = Stopwatch()..start();
    counter = 0;
    milliseconds = 0;
    for (var i = 0; i < amount; i++) {
      counter++;
      await Future.delayed(Duration.zero);
      notifyListeners();

      if (counter % 5000 == 0 && counter != 0) {
        isMilestoneReached = !isMilestoneReached;
        notifyListeners();
      }
    }
    stopwatch.stop();
    milliseconds = stopwatch.elapsedMilliseconds;
    notifyListeners();
  }
}
