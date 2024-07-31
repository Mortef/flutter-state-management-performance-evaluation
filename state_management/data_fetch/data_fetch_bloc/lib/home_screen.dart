import 'package:data_fetch_bloc/bloc/data_fetch_bloc.dart';
import 'package:data_fetch_bloc/helpers/main_screen_material.dart';
import 'package:data_fetch_bloc/post_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    // This constants are used to pass the values from the python script
    const warmUpAmount = int.fromEnvironment('WARM_UP_COUNT', defaultValue: 0);
    const loopAmount = int.fromEnvironment('LOOP_AMOUNT', defaultValue: 0);
    const countAmount = int.fromEnvironment('COUNT_AMOUNT', defaultValue: 0);

    final dataFetchBloc = context.read<DataFetchBloc>();

    for (var i = 0; i < warmUpAmount; i++) {
      dataFetchBloc.add(const DataFetchEvent.clearPosts());
      // Wait for the state to be updated, we want sequential execution
      await dataFetchBloc.stream
          .firstWhere((state) => !state.isLoading && state.posts.isEmpty);
      await Future.delayed(Duration.zero);

      dataFetchBloc.add(const DataFetchEvent.loadPosts());
      // Wait for the state to be updated, we want sequential execution
      await dataFetchBloc.stream
          .firstWhere((state) => !state.isLoading && state.posts.isNotEmpty);
      await Future.delayed(Duration.zero);
    }

    for (var i = 0; i < loopAmount; i++) {
      // This print is used by the python script to collect the data
      // ignore: avoid_print
      print('Starting loop ${i + 1}');
      final stopwatch = Stopwatch()..start();
      for (var j = 0; j < countAmount; j++) {
        dataFetchBloc.add(const DataFetchEvent.clearPosts());
        // Wait for the state to be updated, we want sequential execution
        await dataFetchBloc.stream
            .firstWhere((state) => !state.isLoading && state.posts.isEmpty);
        await Future.delayed(Duration.zero);

        dataFetchBloc.add(const DataFetchEvent.loadPosts());
        // Wait for the state to be updated, we want sequential execution
        await dataFetchBloc.stream
            .firstWhere((state) => !state.isLoading && state.posts.isNotEmpty);
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
    return BlocBuilder<DataFetchBloc, DataFetchState>(
      builder: (context, state) {
        final isLoading = state.isLoading;

        if (isLoading) {
          return const Material(
              child: Center(child: CircularProgressIndicator()));
        }

        final posts = state.posts;

        final testListTiles =
            posts.map((post) => PostTile(post: post)).toList(growable: false);

        final children = <Widget>[
          const SizedBox(height: 40),
          ...testListTiles,
          const SizedBox(height: 40),
        ];

        return MainScreenMaterial(children: children);
      },
    );
  }
}
