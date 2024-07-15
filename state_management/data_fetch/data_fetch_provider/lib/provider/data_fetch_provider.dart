import 'package:data_fetch_provider/api/api_service.dart';
import 'package:data_fetch_provider/api/models/post.dart';
import 'package:flutter/material.dart';

class DataFetchProvider extends ChangeNotifier {
  bool isLoading = false;
  List<Post> posts = [];

  Future<void> loadPosts() async {
    isLoading = true;
    notifyListeners();
    posts = await fetchPosts();
    isLoading = false;
    notifyListeners();
  }

  Future<void> clearPosts() async {
    posts = const [];
    notifyListeners();
  }
}
