import 'package:data_fetch_mobx/api/api_service.dart';
import 'package:data_fetch_mobx/api/models/post.dart';
import 'package:mobx/mobx.dart';

part 'data_fetch_store.g.dart';

// ignore: library_private_types_in_public_api
class DataFetchStore = _DataFetchStore with _$DataFetchStore;

abstract class _DataFetchStore with Store {
  @observable
  bool isLoading = false;

  @observable
  List<Post> posts = [];

  @action
  Future<void> loadPosts() async {
    isLoading = true;
    posts = await fetchPosts();
    isLoading = false;
  }

  @action
  Future<void> clearPosts() async {
    posts = [];
  }
}
