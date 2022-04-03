import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'addTask.dart';
import 'theme.dart';

class neumorphismButton extends StatefulWidget {
  const neumorphismButton({Key? key}) : super(key: key);

  @override
  State<neumorphismButton> createState() => _neumorphismButtonState();
}

bool _isPressed = false;

class _neumorphismButtonState extends State<neumorphismButton> {
  Offset distanceBtn = _isPressed ? const Offset(7, 7) : const Offset(11, 5);
  double blurbtn = _isPressed ? 5.0 : 16.0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        setState(() {
          showDialog(
            context: context,
            builder: (BuildContext context) => AddTask(context),
          );
        });
      }),
      child: Listener(
        onPointerUp: (_) => setState(() => _isPressed = false),
        onPointerDown: (_) => setState(() => _isPressed = true),
        child: AnimatedContainer(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.add_card),
              SizedBox(width: 5),
              Text("Add New Task"),
            ],
          ),
          duration: const Duration(milliseconds: 100),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: backgroundColor,
            boxShadow: [
              BoxShadow(
                blurRadius: blurbtn,
                offset: -distanceBtn,
                color: onGroundColor,
                inset: _isPressed,
              ),
              BoxShadow(
                blurRadius: blurbtn,
                offset: distanceBtn,
                color: offGroundColor,
                inset: _isPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
