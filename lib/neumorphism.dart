import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'theme.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

bool _isPressed = true;
bool isDarkMode = false;

Offset distance = _isPressed ? const Offset(10, 10) : const Offset(28, 28);
// Offset distance = const Offset(8, 8);
double blur = _isPressed ? 5.0 : 30.0;

class CustomNeumorphism extends StatefulWidget {
  const CustomNeumorphism({Key? key}) : super(key: key);

  @override
  State<CustomNeumorphism> createState() => _CustomNeumorphismState();
}

class _CustomNeumorphismState extends State<CustomNeumorphism> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _isPressed = !_isPressed),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
              blurRadius: blur,
              offset: -distance,
              color: onGroundColor,
              inset: _isPressed,
            ),
            BoxShadow(
              blurRadius: blur,
              offset: distance,
              color: offGroundColor,
              inset: _isPressed,
            ),
          ],
        ),
      ),
    );
  }
}
