import 'package:data_fetch_provider/home_screen.dart';
import 'package:data_fetch_provider/provider/data_fetch_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme.light(),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (_) => DataFetchProvider(),
        child: const HomeScreen(),
      ),
    );
  }
}
