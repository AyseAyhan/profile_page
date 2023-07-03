import 'package:flutter/material.dart';
import 'package:profile_page/pages/profile.dart';
import 'package:profile_page/utils/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await UserPreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key});

  static const String title = 'User Profile';

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  bool isDarkModeEnabled = false;

  void toggleDarkMode() {
    setState(() {
      isDarkModeEnabled = !isDarkModeEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {

    final brightness = isDarkModeEnabled ? Brightness.dark : Brightness.light;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        brightness: brightness,
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            color: Colors.white,
          ),
          bodyText2: TextStyle(
            color: Colors.white,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
        ),
      ),
      title: MyApp.title,
      home: ProfilePage(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                icon: Icon(isDarkModeEnabled ? Icons.light_mode : Icons.dark_mode),
                onPressed: () => toggleDarkMode(),
              ),
            ],
          ),
          body: child,
        );
      },
    );
  }
}

