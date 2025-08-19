// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:programming_playground/models/Book.dart';
import 'package:programming_playground/models/CoolThing.dart';
import 'package:programming_playground/services/BookService.dart';

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
    thing = Book(subtitle: "(so far)", name: "The Coolest Thing", downloads: 0);
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
          spacing: 12,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Welcome to the Playground Home Screen!"),
            Card(
              color: Colors.deepPurple[200],
              child: Container(
                padding: const EdgeInsets.all(24),
                child: thing != null
                    ? Column(
                        children: [
                          Text(
                            thing!.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          Text(thing!.subtitle),
                        ],
                      )
                    : const Text("No cool things yet."),
              ),
            ),
            TextButton(
              onPressed: () async {
                CoolThing? foundCoolThing = await BookService().getSingleThing(
                  "1234",
                );
                if (foundCoolThing != null) {
                  setState(() {
                    thing = foundCoolThing;
                  });
                }
              },
              child: Text("Get Cool Thing"),
            ),
          ],
        ),
      ),
    );
  }
}
