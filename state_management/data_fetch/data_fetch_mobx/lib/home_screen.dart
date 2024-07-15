import 'package:data_fetch_mobx/api/models/post.dart';
import 'package:data_fetch_mobx/helpers/main_screen_material.dart';
import 'package:data_fetch_mobx/mobx/data_fetch_store.dart';
import 'package:data_fetch_mobx/post_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
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
    final dataFetchStore = context.read<DataFetchStore>();

    // This constants are used to pass the values from the python script
    const warmUpAmount = int.fromEnvironment('WARM_UP_COUNT', defaultValue: 0);
    const loopAmount = int.fromEnvironment('LOOP_AMOUNT', defaultValue: 0);
    const countAmount = int.fromEnvironment('COUNT_AMOUNT', defaultValue: 0);

    for (var i = 0; i < warmUpAmount; i++) {
      await dataFetchStore.clearPosts();
      await Future.delayed(Duration.zero);
      await dataFetchStore.loadPosts();
      await Future.delayed(Duration.zero);
    }

    for (var i = 0; i < loopAmount; i++) {
      // This print is used by the python script to collect the data
      // ignore: avoid_print
      print('Starting loop ${i + 1}');
      final stopwatch = Stopwatch()..start();
      for (var j = 0; j < countAmount; j++) {
        await dataFetchStore.clearPosts();
        await Future.delayed(Duration.zero);
        await dataFetchStore.loadPosts();
        await Future.delayed(Duration.zero);

        // This print is used by the python script to collect the data
        // ignore: avoid_print
        print('Next iteration');
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
    return Observer(builder: (context) {
      final isLoading =
          context.select<DataFetchStore, bool>((s) => s.isLoading);

      if (isLoading) {
        return const Material(
            child: Center(child: CircularProgressIndicator()));
      }

      final posts = context.select<DataFetchStore, List<Post>>((s) => s.posts);

      final testListTiles =
          posts.map((post) => PostTile(post: post)).toList(growable: false);

      final children = <Widget>[
        const SizedBox(height: 40),
        ...testListTiles,
        const SizedBox(height: 40),
      ];

      return MainScreenMaterial(children: children);
    });
  }
}
