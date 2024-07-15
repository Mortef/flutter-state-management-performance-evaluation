import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_bloc.freezed.dart';
part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const _Initial()) {
    on<CounterEvent>((event, emit) async {
      await event.map(
        loopAmount: (e) async {
          final stopwatch = Stopwatch()..start();

          emit(state.copyWith(counter: 0, milliseconds: 0));

          for (var i = 0; i < e.amount; i++) {
            emit(state.copyWith(counter: state.counter + 1));
            await Future.delayed(Duration.zero);
            if (state.counter % 5000 == 0 && state.counter != 0) {
              emit(state.copyWith(
                  isMilestoneReached: !state.isMilestoneReached));
            }
          }

          stopwatch.stop();
          emit(state.copyWith(milliseconds: stopwatch.elapsedMilliseconds));
        },
      );
    });
  }
}
