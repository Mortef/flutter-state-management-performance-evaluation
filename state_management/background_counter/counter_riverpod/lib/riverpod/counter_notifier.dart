import 'package:counter_riverpod/riverpod/counter_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider =
    StateNotifierProvider.autoDispose<CounterNotifier, CounterState>(
  (ref) => CounterNotifier(),
);

class CounterNotifier extends StateNotifier<CounterState> {
  CounterNotifier() : super(const CounterState());

  void _incrementCounter() {
    state = state.copyWith(counter: state.counter + 1);
  }

  Future<void> loopAmount(int amount) async {
    final stopwatch = Stopwatch()..start();

    state = state.copyWith(counter: 0, milliseconds: 0);

    for (var i = 0; i < amount; i++) {
      _incrementCounter();
      await Future.delayed(Duration.zero);

      if (state.counter % 5000 == 0 && state.counter != 0) {
        state = state.copyWith(isMilestoneReached: !state.isMilestoneReached);
      }
    }

    stopwatch.stop();
    state = state.copyWith(milliseconds: stopwatch.elapsedMilliseconds);
  }
}
