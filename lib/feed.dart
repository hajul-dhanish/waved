import 'package:flutter/material.dart';
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
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
