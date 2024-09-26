import 'package:flutter/material.dart';
import 'package:secure_storage_sample_app/Pages/HomeScreen/HomeScreen.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4B1535)),
        useMaterial3: true,
      ),
      home: const HomeScreen(title: 'Flutter - Secure Storage'),
    );
  }
}
