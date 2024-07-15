import 'package:counter_riverpod/helpers/counter_material.dart';
import 'package:counter_riverpod/riverpod/counter_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => runAfterBuildComplete());
  }

  void runAfterBuildComplete() async {
    final counterNotifier = ref.read(counterProvider.notifier);

    // This constants are used to pass the values from the python script
    const warmUpAmount = int.fromEnvironment('WARM_UP_COUNT', defaultValue: 0);
    const loopAmount = int.fromEnvironment('LOOP_AMOUNT', defaultValue: 0);
    const countAmount = int.fromEnvironment('COUNT_AMOUNT', defaultValue: 0);
    for (var i = 0; i < 10; i++) {
      await counterNotifier.loopAmount(warmUpAmount);
    }
    for (var i = 0; i < loopAmount; i++) {
      await counterNotifier.loopAmount(countAmount);
      final milliseconds = ref.read(counterProvider).milliseconds;

      // This print is used by the python script to collect the data
      // ignore: avoid_print
      print('Total time: $milliseconds ms');
    }

    // This print is used by the python script to know when to stop the app
    // ignore: avoid_print
    print('All jobs finished');
  }

  @override
  Widget build(BuildContext context) {
    final children = [
      const _CounterText(),
      const _InputWidget(),
      const _MsText(),
    ];
    return CounterMaterial(children: children);
  }
}

class _InputWidget extends HookConsumerWidget {
  const _InputWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const buttonText = Text('Loop');
    final controller = useTextEditingController(text: '10000');

    final textField = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(
          labelText: 'Enter loop count amount',
        ),
        keyboardType: TextInputType.number,
      ),
    );

    void onPressed() {
      final number = int.tryParse(controller.text) ?? 0;
      ref.read(counterProvider.notifier).loopAmount(number);
    }

    final loopButton = ElevatedButton(onPressed: onPressed, child: buttonText);

    return Column(
      children: [
        textField,
        const SizedBox(height: 16),
        loopButton,
      ],
    );
  }
}

class _CounterText extends ConsumerWidget {
  const _CounterText();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider).counter;

    return Text(
      'Loop count: $counter',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}

class _MsText extends ConsumerWidget {
  const _MsText();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final milliseconds = ref.watch(counterProvider).milliseconds;
    if (milliseconds == 0) return const SizedBox.shrink();

    return Text('Elapsed time: $milliseconds ms');
  }
}
