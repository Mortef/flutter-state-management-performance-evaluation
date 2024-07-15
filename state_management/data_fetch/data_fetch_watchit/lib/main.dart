import 'package:data_fetch_watchit/home_screen.dart';
import 'package:data_fetch_watchit/watchit/data_fetch_manager.dart';
import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

void main() {
  registerManager();
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
      home: const HomeScreen(),
    );
  }
}

void registerManager() {
  GetIt.instance.registerSingleton<DataFetchManager>(DataFetchManager());
}
