import 'package:angel_lanking/screen/Signup_name.dart';
import 'package:angel_lanking/widget/Button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
                  'https://s3-alpha-sig.figma.com/img/6976/fcb3/4c86021c9697c169dc32a088c690cc7b?Expires=1675036800&Signature=gFePITCQednkmSwGjHnL4mdYHdIblBAgRHc20gAB4KQ2~g6A7UQu6TFWSxus72tPmD--ldIOMxfkORYUIx5lGvzIcwE3J~b-71iRY9Cc7MUgBED0eikUGqc~bfuPINSRoIAgxCuVsGWG9SIGtxjBH3Fev2Kt~mC2f8~m9Q6XyGAk632zdI0MelP7eXNoS3hovyWw~UbCtFbxDCrHT4CPxK20p4V4HvILJqKsMIwnSaIJZ5q7XM955mTTYf3kM72T41f7c1YliKx5bR4BHoXL0LvI7~Hp39EWg-nPSRqhTUr6djDyEZAkM4qLQA6ewAqqxNqg9~h9P~IbMhmCdZJYsw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                  width: 250,
                ),
              ),
            ),
            const SizedBox(
              height: 120,
            ),
            GestureDetector(
              onTap: Singup_with_google,
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
              onTap: Singup_with_kakao,
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((BuildContext context) => const Signup_name()),
                    fullscreenDialog: true,
                  ),
                );
              },
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
