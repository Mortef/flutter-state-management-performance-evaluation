import 'package:data_fetch_getx/api/api_service.dart';
import 'package:data_fetch_getx/api/models/post.dart';
import 'package:get/get.dart';

class DataFetchController extends GetxController {
  var isLoading = false.obs;
  var posts = List<Post>.empty().obs;

  Future<void> loadPosts() async {
    isLoading.value = true;
    posts.value = await fetchPosts();
    isLoading.value = false;
  }

  Future<void> clearPosts() async {
    posts.value = [];
  }
}
