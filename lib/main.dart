import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: "WaveD", debugShowCheckedModeBanner: false, home: HomeCheck());
  }
}

class HomeCheck extends StatefulWidget {
  const HomeCheck({Key? key}) : super(key: key);

  @override
  State<HomeCheck> createState() => _HomeCheckState();
}

class _HomeCheckState extends State<HomeCheck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WaveD"),
        actions: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Version: 0.1A-Beta"),
                  ),
                );
              });
            },
            child: const Text("Version"),
          ),
        ],
      ),
    );
  }
}
