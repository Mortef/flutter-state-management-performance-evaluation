import 'package:data_fetch_riverpod/helpers/main_screen_material.dart';
import 'package:data_fetch_riverpod/post_tile.dart';
import 'package:data_fetch_riverpod/riverpod/data_fetch_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    final notifier = ref.read(dataFetchProvider.notifier);

    // This constants are used to pass the values from the python script
    const warmUpAmount = int.fromEnvironment('WARM_UP_COUNT', defaultValue: 0);
    const loopAmount = int.fromEnvironment('LOOP_AMOUNT', defaultValue: 0);
    const countAmount = int.fromEnvironment('COUNT_AMOUNT', defaultValue: 0);

    for (var i = 0; i < warmUpAmount; i++) {
      await notifier.clearPosts();
      await Future.delayed(Duration.zero);
      await notifier.loadPosts();
      await Future.delayed(Duration.zero);
    }

    for (var i = 0; i < loopAmount; i++) {
      // This print is used by the python script to collect the data
      // ignore: avoid_print
      print('Starting loop ${i + 1}');
      final stopwatch = Stopwatch()..start();
      for (var j = 0; j < countAmount; j++) {
        await notifier.clearPosts();
        await Future.delayed(Duration.zero);
        await notifier.loadPosts();
        await Future.delayed(Duration.zero);
      }
      stopwatch.stop();

      // This print is used by the python script to collect the data
      // ignore: avoid_print
      print('Loop ${i + 1} completed in ${stopwatch.elapsedMilliseconds} ms');
    }

    // This print is used by the python script to know when to stop the app
    // ignore: avoid_print
    print('All jobs finished');
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(dataFetchProvider.select((s) => s.isLoading));

    if (isLoading) {
      return const Material(child: Center(child: CircularProgressIndicator()));
    }

    final posts = ref.watch(dataFetchProvider.select((s) => s.posts));

    final testListTiles =
        posts.map((post) => PostTile(post: post)).toList(growable: false);

    final children = <Widget>[
      const SizedBox(height: 40),
      ...testListTiles,
      const SizedBox(height: 40),
    ];

    return MainScreenMaterial(children: children);
  }
}
