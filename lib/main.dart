import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:waved/feed.dart';
import 'authenticator/auth_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'neumorphism.dart';
import 'setting.dart';
import 'theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // static final ValueNotifier<ThemeMode> themeNotifier =
  //     ValueNotifier(ThemeMode.light);

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return ValueListenableBuilder<ThemeMode>(
    //     valueListenable: themeNotifier,
    //     builder: (_, ThemeMode currentMode, __) {
    return MaterialApp(
      title: "WaveD",
      debugShowCheckedModeBanner: false,
      // darkTheme: ThemeData.dark(),
      // themeMode: currentMode,
      theme: customThemeData,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, usersnapshot) {
          if (usersnapshot.hasData) {
            return const HomeCheck();
          } else {
            return const AuthScreen();
          }
        },
      ),
    );
    // });
  }
}

class HomeCheck extends StatefulWidget {
  const HomeCheck({Key? key}) : super(key: key);

  @override
  State<HomeCheck> createState() => _HomeCheckState();
}

class _HomeCheckState extends State<HomeCheck> {
  // BottomBarSetup
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    FeedVision(),
    SettingVision(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  // </BottomBarSetup>

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("WaveD"),
        // actions: [
        //   IconButton(
        //     icon: Icon(MyApp.themeNotifier.value == ThemeMode.light
        //         ? Icons.dark_mode
        //         : Icons.light_mode),
        //     onPressed: () {
        //       setState(() {
        //         MyApp.themeNotifier.value =
        //             MyApp.themeNotifier.value == ThemeMode.light
        //                 ? ThemeMode.dark
        //                 : ThemeMode.light;
        //       });
        //     },
        //   ),
        // ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Setting"),
          ],
          type: BottomNavigationBarType.fixed, // Fixed
          backgroundColor: backgroundColor, // <-- This works for fixed
          selectedItemColor: isDarkMode ? Colors.white : Colors.black,
          unselectedItemColor: isDarkMode ? Colors.white30 : Colors.black38,
          currentIndex: _selectedIndex,
          iconSize: 30,
          onTap: _onItemTapped,
          elevation: 5),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
