import 'package:flutter/material.dart';
import 'package:waved/theme.dart';

import 'main.dart';
import 'workwide.dart';

class SettingVision extends StatefulWidget {
  const SettingVision({Key? key}) : super(key: key);

  @override
  State<SettingVision> createState() => _SettingVisionState();
}

class _SettingVisionState extends State<SettingVision> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        //Version Port
        customListTile(
          title: "Version",
          tail: Text(
            "0.11.Edge",
            style: TextStyle(color: iconSelColor),
          ),
          onLongTab: () {
            setState(() {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text("Waved is up to date"),
                  action: SnackBarAction(label: "ok", onPressed: () {}),
                ),
              );
            });
          },
        ),
      ],
    ));
  }

  Widget customListTile(
      {required String title,
      tail,
      VoidCallback? onTab,
      VoidCallback? onLongTab}) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: iconSelColor),
      ),
      trailing: tail,
      onLongPress: onLongTab,
      onTap: onTab,
    );
  }
}
