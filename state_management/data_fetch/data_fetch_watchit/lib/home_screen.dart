import 'package:data_fetch_watchit/helpers/main_screen_material.dart';
import 'package:data_fetch_watchit/post_tile.dart';
import 'package:data_fetch_watchit/watchit/data_fetch_manager.dart';
import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

class HomeScreen extends WatchingStatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => runAfterBuildComplete());
  }

  void runAfterBuildComplete() async {
    final dataFetchManager = GetIt.I.get<DataFetchManager>();

    // This constants are used to pass the values from the python script
    const warmUpAmount = int.fromEnvironment('WARM_UP_COUNT', defaultValue: 0);
    const loopAmount = int.fromEnvironment('LOOP_AMOUNT', defaultValue: 0);
    const countAmount = int.fromEnvironment('COUNT_AMOUNT', defaultValue: 0);

    for (var i = 0; i < warmUpAmount; i++) {
      await dataFetchManager.clearPosts();
      await Future.delayed(Duration.zero);
      await dataFetchManager.loadPosts();
      await Future.delayed(Duration.zero);
    }

    for (var i = 0; i < loopAmount; i++) {
      // This print is used by the python script to collect the data
      // ignore: avoid_print
      print('Starting loop ${i + 1}');
      final stopwatch = Stopwatch()..start();
      for (var j = 0; j < countAmount; j++) {
        await dataFetchManager.clearPosts();
        await Future.delayed(Duration.zero);
        await dataFetchManager.loadPosts();
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
    final isLoading = watchValue((DataFetchManager s) => s.isLoading);

    if (isLoading) {
      return const Material(child: Center(child: CircularProgressIndicator()));
    }

    final posts = watchValue((DataFetchManager s) => s.posts);

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
