// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:programming_playground/models/CoolThing.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CoolThing? thing;

  @override
  void initState() {
    super.initState();
    thing = CoolThing(id: 0, name: "The Coolest Thing");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Welcome to the Playground Home Screen!"),
            Card(
              color: Colors.deepPurple[200],
              child: Text(
                thing != null
                    ? "${thing!.name} (id: ${thing!.id})"
                    : "No cool things yet.",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
