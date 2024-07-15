import 'package:data_fetch_riverpod/api/api_service.dart';
import 'package:data_fetch_riverpod/riverpod/data_fetch_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dataFetchProvider =
    StateNotifierProvider<DataFetchNotifier, DataFetchState>(
        (ref) => DataFetchNotifier());

class DataFetchNotifier extends StateNotifier<DataFetchState> {
  DataFetchNotifier() : super(const DataFetchState());

  Future<void> loadPosts() async {
    state = state.copyWith(isLoading: true);
    final posts = await fetchPosts();
    state = state.copyWith(posts: posts, isLoading: false);
  }

  Future<void> clearPosts() async {
    state = state.copyWith(posts: const []);
  }
}
