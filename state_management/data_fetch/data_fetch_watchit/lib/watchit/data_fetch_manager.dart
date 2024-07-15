import 'package:data_fetch_watchit/api/api_service.dart';
import 'package:data_fetch_watchit/api/models/post.dart';
import 'package:flutter/material.dart';

class DataFetchManager {
  ValueNotifier<bool> isLoading = ValueNotifier(false);
  ValueNotifier<List<Post>> posts = ValueNotifier([]);

  Future<void> loadPosts() async {
    isLoading.value = true;
    posts.value = await fetchPosts();
    isLoading.value = false;
  }

  Future<void> clearPosts() async {
    posts.value = [];
  }
}
