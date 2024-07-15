import 'dart:convert';
import 'dart:developer';

import 'package:data_fetch_bloc/api/models/post.dart';
import 'package:http/http.dart' as http;

Future<List<Post>> fetchPosts() async {
  try {
    final stopwatch = Stopwatch()..start();

    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      final List<Post> posts =
          jsonList.map((json) => Post.fromJson(json)).toList();
      stopwatch.stop();
      // This print is used by the python script to collect the data
      // ignore: avoid_print
      print('Fetched posts in ${stopwatch.elapsedMilliseconds} ms');
      return posts;
    } else {
      stopwatch.stop();
      throw Exception(
          'Failed to load posts: Status Code ${response.statusCode}');
    }
  } catch (error) {
    log('Error fetching posts: $error');
    rethrow;
  }
}
