import 'package:flutter/material.dart';
import 'package:programming_playground/services/HomeScreen.dart';

void main() {
  runApp(const Playground());
}

class Playground extends StatelessWidget {
  const Playground({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Programming Playground',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomeScreen(title: 'Playground Home Page'),
    );
  }
}
