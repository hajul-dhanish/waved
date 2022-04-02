import 'package:flutter/material.dart';
import 'theme.dart';

class FeedVision extends StatefulWidget {
  const FeedVision({Key? key}) : super(key: key);

  @override
  State<FeedVision> createState() => _FeedVisionState();
}

class _FeedVisionState extends State<FeedVision> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: backgroundColor,
      alignment: Alignment.center,
      transformAlignment: Alignment.center,
      child: Container(
        color: const Color(0xff6f1e51),
        child: Container(
          width: 159,
          height: 159,
          child: Icon(
            Icons.star,
            size: 53,
            color: iconSelColor,
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(63),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff570639),
                Color(0xff873669),
              ],
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0xff873669),
                offset: Offset(-21.1, -21.1),
                blurRadius: 32,
                spreadRadius: 0.0,
              ),
              BoxShadow(
                color: Color(0xff570639),
                offset: Offset(21.1, 21.1),
                blurRadius: 32,
                spreadRadius: 0.0,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
