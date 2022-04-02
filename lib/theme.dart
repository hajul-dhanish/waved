import 'package:flutter/material.dart';

Color backgroundColor = const Color(0xff6f1e51);
Color iconSelColor = Colors.white;

ThemeData customThemeData = ThemeData(
  splashColor: Colors.purple,
  focusColor: Colors.purple,
  scaffoldBackgroundColor: backgroundColor,
  appBarTheme: AppBarTheme(
    backgroundColor: backgroundColor,
    elevation: 0,
  ),
  canvasColor: backgroundColor,
);
