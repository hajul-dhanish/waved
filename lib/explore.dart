import 'package:flutter/material.dart';

import 'neumorphism.dart';

class Explorevision extends StatefulWidget {
  const Explorevision({Key? key}) : super(key: key);

  @override
  State<Explorevision> createState() => _ExplorevisionState();
}

class _ExplorevisionState extends State<Explorevision> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 200, maxWidth: 200),
          child: const CustomNeumorphism(),
        ),
      ),
    );
  }
}
