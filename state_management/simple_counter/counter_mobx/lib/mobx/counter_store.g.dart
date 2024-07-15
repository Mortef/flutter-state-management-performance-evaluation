// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CounterStore on _CounterStore, Store {
  late final _$counterAtom =
      Atom(name: '_CounterStore.counter', context: context);

  @override
  int get counter {
    _$counterAtom.reportRead();
    return super.counter;
  }

  @override
  set counter(int value) {
    _$counterAtom.reportWrite(value, super.counter, () {
      super.counter = value;
    });
  }

  late final _$millisecondsAtom =
      Atom(name: '_CounterStore.milliseconds', context: context);

  @override
  int get milliseconds {
    _$millisecondsAtom.reportRead();
    return super.milliseconds;
  }

  @override
  set milliseconds(int value) {
    _$millisecondsAtom.reportWrite(value, super.milliseconds, () {
      super.milliseconds = value;
    });
  }

  late final _$loopAsyncAction =
      AsyncAction('_CounterStore.loop', context: context);

  @override
  Future<void> loop(int amount) {
    return _$loopAsyncAction.run(() => super.loop(amount));
  }

  @override
  String toString() {
    return '''
counter: ${counter},
milliseconds: ${milliseconds}
    ''';
  }
}
