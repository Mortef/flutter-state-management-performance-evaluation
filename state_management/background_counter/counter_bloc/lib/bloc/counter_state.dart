part of 'counter_bloc.dart';

@freezed
class CounterState with _$CounterState {
  const factory CounterState.initial({
    @Default(0) int counter,
    @Default(0) int milliseconds,
    @Default(false) bool isMilestoneReached,
  }) = _Initial;
}
