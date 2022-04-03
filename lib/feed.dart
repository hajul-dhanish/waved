import 'package:flutter/material.dart';
import 'package:waved/theme.dart';
import 'neumorphism.dart';
import 'neumorphismbtn.dart';

class FeedVision extends StatefulWidget {
  const FeedVision({Key? key}) : super(key: key);

  @override
  State<FeedVision> createState() => _FeedVisionState();
}

class _FeedVisionState extends State<FeedVision> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 100,
        padding: const EdgeInsets.all(30),
        child: const neumorphismButton(),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                child: ListTile(
                  tileColor: Colors.transparent,
                  title: const Text("Going to chennai"),
                  trailing: TextButton(
                    onPressed: () {},
                    child: const Icon(Icons.done),
                  ),
                ),
                elevation: 3,
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
              ),
              Card(
                child: ListTile(
                  tileColor: Colors.transparent,
                  title: const Text("Secound Review"),
                  trailing: TextButton(
                    onPressed: () {},
                    child: const Icon(Icons.done),
                  ),
                ),
                elevation: 3,
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
              ),
              Card(
                child: ListTile(
                  tileColor: Colors.transparent,
                  title: const Text("Gsit push"),
                  trailing: TextButton(
                    onPressed: () {},
                    child: const Icon(Icons.done),
                  ),
                ),
                elevation: 3,
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
