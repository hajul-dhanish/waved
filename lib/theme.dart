import 'package:flutter/material.dart';
import 'neumorphism.dart';

final backgroundColor =
    isDarkMode ? const Color(0xFF2E3239) : const Color(0xFFE7ECEF);

Color onGroundColor =
    isDarkMode ? const Color(0xFF35393F) : const Color(0xFFEEF5F8);

Color offGroundColor =
    isDarkMode ? const Color(0xFF23262A) : const Color(0xFFA7A9AF);

Color white = Colors.white;

Color iconSelColor = Colors.black;

ThemeData customThemeData = ThemeData(
  splashColor: Colors.white,
  focusColor: Colors.white,
  scaffoldBackgroundColor: backgroundColor,
  appBarTheme: AppBarTheme(
    backgroundColor: backgroundColor,
    elevation: 0,
    titleTextStyle: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
    iconTheme: IconThemeData(color: isDarkMode ? Colors.white : Colors.black),
  ),
  canvasColor: backgroundColor,
);
