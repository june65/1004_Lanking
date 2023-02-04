import 'package:angel_lanking/screen/Login.dart';
import 'package:angel_lanking/screen/Signup_group.dart';
import 'package:angel_lanking/widget/Button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signup_name extends StatefulWidget {
  const Signup_name({super.key});

  @override
  State<Signup_name> createState() => _Signup_nameState();
}

class _Signup_nameState extends State<Signup_name> {
  TextEditingController user_id = TextEditingController();

  Color button_color = Colors.grey;
  @override
  void initState() {
    super.initState();
  }

  void button_color_fuction() {
    if (user_id.text.length >= 5 &&
        user_id.text.length <= 10 &&
        user_id.text.replaceAll(RegExp('[^a-zA-Z0-9\\s]'), "") ==
            user_id.text &&
        user_id.text.replaceAll(RegExp(' '), "") == user_id.text) {
      button_color = Colors.black;
    } else {
      button_color = Colors.grey;
    }
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
          children: [
            Flexible(
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Hero(
                        tag: 'main_symbol',
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.network(
                                'https://s3-alpha-sig.figma.com/img/6976/fcb3/4c86021c9697c169dc32a088c690cc7b?Expires=1676246400&Signature=g9gIGEs5AiVZIkHTI-Qboh7AGpwje3Pr-B-nCnDQmYkVz3wzQs3df6UBOu9DE35XM2QQfyN1G71PhXLJiaiWHCatb9HTk6ymkeIt6HaAmGTdZfOYY-stbS9LC4YULcQcsoy9trTRswdx2ABObf1nG4~9LoJDI1jiXxXRcUik2z2dXBhhEo8B~p~6Eb419-nuwie~4YejMv09VR4KQnOcwEayS22xBYcMnt3ureyfsFhwNrQgkzpZq6NAkMat8hHdqBI-dtt9d0UID4TPmJRjhq-65bmX4aaTGgaBqCqQqr8ATGPRCkvclTgTYroWqPlL6U5vc9ohipEhxJLfMB2T1g__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                                width: 150,
                                height: 100,
                                fit: BoxFit.fitWidth),
                            StreamBuilder(
                              stream: FirebaseAuth.instance.authStateChanges(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<User?> snapshot) {
                                return (!snapshot.hasData)
                                    ? Center(
                                        child: TextButton(
                                          child: const Text(
                                            '<<뒤로',
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Color(0xFF3B3B3B)),
                                          ),
                                          onPressed: () {
                                            FirebaseAuth.instance.signOut();
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder:
                                                    ((BuildContext context) =>
                                                        const Login()),
                                                fullscreenDialog: true,
                                              ),
                                            );
                                          },
                                        ),
                                      )
                                    : Center(
                                        child: TextButton(
                                          child: const Text(
                                            '<<뒤로',
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Color(0xFF3B3B3B)),
                                          ),
                                          onPressed: () {
                                            FirebaseAuth.instance.signOut();
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder:
                                                    ((BuildContext context) =>
                                                        const Login()),
                                                fullscreenDialog: true,
                                              ),
                                            );
                                          },
                                        ),
                                      );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 120,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Hero(
                                  tag: 'location_icon',
                                  child: Icon(
                                    Icons.edit_location_alt_rounded,
                                    color: Color(0xFF787878),
                                  ),
                                ),
                                Icon(
                                  Icons.beenhere_rounded,
                                  color: Color(0xFFFEFEFE),
                                ),
                                Icon(
                                  Icons.beenhere_rounded,
                                  color: Color(0xFFFEFEFE),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Icon(
                                  Icons.circle,
                                  size: 15,
                                  color: Color(0xFF787878),
                                ),
                                Icon(
                                  Icons.circle,
                                  size: 15,
                                  color: Color(0xFFD9D9D9),
                                ),
                                Icon(
                                  Icons.circle,
                                  size: 15,
                                  color: Color(0xFFD9D9D9),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 20,
                        ),
                        child: Text(
                          '앞으로 사용할 아이디를 설정해주세요',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Column(
                      children: [
                        TextField(
                          controller: user_id,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '영문 + 숫자 5~10자',
                          ),
                          onChanged: (value) {
                            setState(() {
                              button_color_fuction();
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                true
                    ? GestureDetector(
                        onTap: () {
                          if (user_id.text.length >= 5 &&
                              user_id.text.length <= 10 &&
                              user_id.text.replaceAll(
                                      RegExp('[^a-zA-Z0-9\\s]'), "") ==
                                  user_id.text &&
                              user_id.text.replaceAll(RegExp(' '), "") ==
                                  user_id.text) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((BuildContext context) =>
                                    Signup_group(
                                      user_id_save: user_id.text,
                                    )),
                                fullscreenDialog: true,
                              ),
                            );
                          }
                        },
                        child: Button(
                          text: 'NEXT',
                          iconshape: Icons.check_circle_outline_outlined,
                          backgroundcolor: button_color,
                          textcolor: Colors.white,
                        ))
                    : const SizedBox(
                        height: 0,
                      ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
