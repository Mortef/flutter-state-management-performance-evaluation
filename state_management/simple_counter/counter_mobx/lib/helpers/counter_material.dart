import 'package:counter_mobx/helpers/iterable_extension.dart';
import 'package:flutter/material.dart';

class CounterMaterial extends StatelessWidget {
  const CounterMaterial({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    const separator = SizedBox(height: 16);
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 100),
        child: Column(children: children.separate(separator)),
      ),
    );
  }
}
