import 'package:angel_lanking/api_service.dart';
import 'package:angel_lanking/firebase_options.dart';
import 'package:angel_lanking/model/user.dart';
import 'package:angel_lanking/screen/Home.dart';
import 'package:angel_lanking/screen/Login.dart';
import 'package:angel_lanking/screen/Signup_name.dart';
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
  late String userID;
  late Future<UserModel>? usermodel;
  late Future<bool>? userexist;

  Future getuserid() async {
    late FirebaseAuth auth;
    late Stream<User?> authStatechanges;

    auth = FirebaseAuth.instance;
    authStatechanges = auth.authStateChanges();
    authStatechanges.listen((User? user) {
      userID = user!.uid;
      userexist = ApiService.findUserdata(user.uid);
      usermodel = ApiService.getUserdata(user.uid);
    });
  }

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
    getuserid();
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
              : FutureBuilder(
                  future: usermodel,
                  builder: ((context, userSnapshot) {
                    if (userSnapshot.hasData) {
                      return FutureBuilder(
                          future: userexist,
                          builder: ((context, userSnapshot2) {
                            if (userSnapshot2.data == false) {
                              return Home(
                                page: 0,
                                search_group: 1,
                                userID: userID,
                                donationList: userSnapshot.data!.donation,
                                my_group: 0,
                                user_group: userSnapshot.data!.group,
                              );
                            } else {
                              return Container();
                            }
                          }));
                    } else {
                      return Signup_name(userID: userID);
                    }
                  }));
        },
      ),
    );
  }
}
