import 'package:angel_lanking/screen/Home.dart';
import 'package:angel_lanking/screen/Login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late SharedPreferences prefs;
  bool First_Login = true;

  Future initPrefs() async {
    prefs = await SharedPreferences.getInstance();

    final Login = prefs.getString('Login');
    if (Login != null) {
      First_Login = false;
    } else {
      First_Login = true;
    }
  }

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: First_Login ? const Login() : const Home(),
    );
  }
}
