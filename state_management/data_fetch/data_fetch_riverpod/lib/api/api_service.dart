import 'dart:convert';
import 'dart:developer';

import 'package:data_fetch_riverpod/api/mock_client_provider.dart';
import 'package:data_fetch_riverpod/api/models/post.dart';

Future<List<Post>> fetchPosts() async {
  try {
    final mockClient = MockClientProvider.createMockClient();

    final stopwatch = Stopwatch()..start();

    final response = await mockClient.get(Uri.parse(''));

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
