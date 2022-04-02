import 'package:flutter/material.dart';
import 'neumorphism.dart';

class FeedVision extends StatefulWidget {
  const FeedVision({Key? key}) : super(key: key);

  @override
  State<FeedVision> createState() => _FeedVisionState();
}

class _FeedVisionState extends State<FeedVision> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 200, maxWidth: 200),
        child: const CustomNeumorphism(),
      ),
    ));
  }
}
