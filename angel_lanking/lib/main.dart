import 'package:angel_lanking/firebase_options.dart';
import 'package:angel_lanking/screen/Home.dart';
import 'package:angel_lanking/screen/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
  /*
  Future initPrefs() async {
    //createData();
    prefs = await SharedPreferences.getInstance();

    final Login = prefs.getString('Login');
    if (Login != null) {
      First_Login = false;
    } else {
      First_Login = true;
    }
  }
  */
  @override
  void initState() {
    super.initState();
    //initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          return (!snapshot.hasData)
              ? const Login()
              : const Home(page: 0, group: 1);
        },
      ),
    );
  }
}
