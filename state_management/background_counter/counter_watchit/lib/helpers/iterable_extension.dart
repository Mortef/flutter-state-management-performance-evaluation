import 'dart:async';

import 'package:flutter/widgets.dart';

extension IterableExt<T> on Iterable<T> {
  Iterable<T> withSeparator(T separator) {
    if (isEmpty) return this;

    return expand((element) => [element, separator]).toList()..removeLast();
  }

  Future<void> forEachAsync(FutureOr<void> Function(T element) action) async {
    for (final element in this) {
      await action(element);
    }
  }

  T reduceOrElse(T Function(T value, T element) combine, T orElse) {
    if (isEmpty) return orElse;

    return reduce(combine);
  }
}

extension WidgetIterableExt on Iterable<Widget> {
  List<Widget> separate(Widget separator) => withSeparator(separator).toList();
}
