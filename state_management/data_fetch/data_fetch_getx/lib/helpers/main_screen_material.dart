import 'package:data_fetch_getx/helpers/iterable_extension.dart';
import 'package:flutter/material.dart';

class MainScreenMaterial extends StatelessWidget {
  const MainScreenMaterial({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    const separator = SizedBox(height: 16);
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
            child: Column(children: children.separate(separator))),
      ),
    );
  }
}
