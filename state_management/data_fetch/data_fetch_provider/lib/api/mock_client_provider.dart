import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

class MockClientProvider {
  static MockClient createMockClient() {
    return MockClient((request) async {
      final jsonString = await rootBundle.loadString('assets/posts.json');
      await Future.delayed(const Duration(milliseconds: 1));
      return http.Response(jsonString, 200);
    });
  }
}
