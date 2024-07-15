part of 'counter_bloc.dart';

@freezed
class CounterEvent with _$CounterEvent {
  const factory CounterEvent.loopAmount(int amount) = _LoopAmount;
}
