import 'package:data_fetch_getx/getx/data_fetch_controller.dart';
import 'package:data_fetch_getx/helpers/main_screen_material.dart';
import 'package:data_fetch_getx/post_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final dataFetchController = Get.put(DataFetchController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => runAfterBuildComplete());
  }

  void runAfterBuildComplete() async {
    // This constants are used to pass the values from the python script
    const warmUpAmount = int.fromEnvironment('WARM_UP_COUNT', defaultValue: 10);
    const loopAmount = int.fromEnvironment('LOOP_AMOUNT', defaultValue: 10);
    const countAmount = int.fromEnvironment('COUNT_AMOUNT', defaultValue: 10);

    for (var i = 0; i < warmUpAmount; i++) {
      await dataFetchController.clearPosts();
      await Future.delayed(Duration.zero);
      await dataFetchController.loadPosts();
      await Future.delayed(Duration.zero);
    }

    for (var i = 0; i < loopAmount; i++) {
      // This print is used by the python script to collect the data
      // ignore: avoid_print
      print('Starting loop ${i + 1}');
      final stopwatch = Stopwatch()..start();
      for (var j = 0; j < countAmount; j++) {
        await dataFetchController.clearPosts();
        await Future.delayed(Duration.zero);
        await dataFetchController.loadPosts();
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
    return Obx(() {
      final isLoading = dataFetchController.isLoading.value;

      if (isLoading) {
        return const Material(
            child: Center(child: CircularProgressIndicator()));
      }

      final posts = dataFetchController.posts.toList();

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
