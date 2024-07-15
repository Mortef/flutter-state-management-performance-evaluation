import 'package:mobx/mobx.dart';

part 'counter_store.g.dart';

// ignore: library_private_types_in_public_api
class CounterStore = _CounterStore with _$CounterStore;

abstract class _CounterStore with Store {
  @observable
  int counter = 0;

  @observable
  int milliseconds = 0;

  @action
  Future<void> loop(int amount) async {
    final stopwatch = Stopwatch()..start();
    counter = 0;
    milliseconds = 0;
    for (var i = 0; i < amount; i++) {
      counter++;
      await Future.delayed(Duration.zero);
    }
    stopwatch.stop();
    milliseconds = stopwatch.elapsedMilliseconds;
  }
}
