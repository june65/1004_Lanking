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
                  'https://s3-alpha-sig.figma.com/img/6976/fcb3/4c86021c9697c169dc32a088c690cc7b?Expires=1676246400&Signature=g9gIGEs5AiVZIkHTI-Qboh7AGpwje3Pr-B-nCnDQmYkVz3wzQs3df6UBOu9DE35XM2QQfyN1G71PhXLJiaiWHCatb9HTk6ymkeIt6HaAmGTdZfOYY-stbS9LC4YULcQcsoy9trTRswdx2ABObf1nG4~9LoJDI1jiXxXRcUik2z2dXBhhEo8B~p~6Eb419-nuwie~4YejMv09VR4KQnOcwEayS22xBYcMnt3ureyfsFhwNrQgkzpZq6NAkMat8hHdqBI-dtt9d0UID4TPmJRjhq-65bmX4aaTGgaBqCqQqr8ATGPRCkvclTgTYroWqPlL6U5vc9ohipEhxJLfMB2T1g__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                  width: 250,
                ),
              ),
            ),
            const SizedBox(
              height: 120,
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
