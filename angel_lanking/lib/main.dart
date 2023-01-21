import 'package:angel_lanking/screen/Login_page_name.dart';
import 'package:angel_lanking/screen/Main_page.dart';
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
  bool first_Login = true;

  Future initPrefs() async {
    prefs = await SharedPreferences.getInstance();

    final Login = prefs.getString('Login');
    if (Login != null) {
      first_Login = false;
    } else {
      first_Login = true;
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
      home: first_Login ? const Login() : const Main(),
    );
  }
}
