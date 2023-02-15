import 'package:angel_lanking/widget/Button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //final _authentication = FirebaseAuth.instance;
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  void initState() {
    super.initState();
  }

  Singup_with_google() async {
    await launchUrlString("https://comic.naver.com/main");
  }

  Singup_with_kakao() async {
    await launchUrlString("https://comic.naver.com/main");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFEFE),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: 'main_symbol',
              child: Center(
                child: Image.network(
                  'https://dogmbti.s3.ap-northeast-2.amazonaws.com/1004_lanking/main_logo.png',
                  width: 250,
                ),
              ),
            ),
            const SizedBox(
              height: 120,
            ),
            GestureDetector(
              onTap: signInWithGoogle,
              child: const Button(
                text: 'Sign in with Google',
                iconshape: Icons.g_translate,
                backgroundcolor: Colors.white,
                textcolor: Color(0xFF777777),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {},
              child: const Button(
                text: 'Sign in with Kakao',
                iconshape: Icons.chat_bubble,
                backgroundcolor: Color(0xFFFEE500),
                textcolor: Color(0xFF181600),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {},
              child: const Button(
                text: 'Sign in with Apple',
                iconshape: Icons.apple,
                backgroundcolor: Colors.black,
                textcolor: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
