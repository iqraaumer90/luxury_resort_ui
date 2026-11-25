import 'package:flutter/material.dart';
import 'package:luxury_resort_ui/luxury_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Luxury Escape',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF594B42)),
        scaffoldBackgroundColor:  Color(0xFFF8F5F1),
        useMaterial3: true,
      ),
      home:  LuxuryHome(),
    );
  }
}
