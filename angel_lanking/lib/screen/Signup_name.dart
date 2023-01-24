import 'package:angel_lanking/widget/Button.dart';
import 'package:flutter/material.dart';

class Signup_name extends StatefulWidget {
  const Signup_name({super.key});

  @override
  State<Signup_name> createState() => _Signup_nameState();
}

class _Signup_nameState extends State<Signup_name> {
  TextEditingController tec = TextEditingController();

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
                                'https://s3-alpha-sig.figma.com/img/6976/fcb3/4c86021c9697c169dc32a088c690cc7b?Expires=1675036800&Signature=gFePITCQednkmSwGjHnL4mdYHdIblBAgRHc20gAB4KQ2~g6A7UQu6TFWSxus72tPmD--ldIOMxfkORYUIx5lGvzIcwE3J~b-71iRY9Cc7MUgBED0eikUGqc~bfuPINSRoIAgxCuVsGWG9SIGtxjBH3Fev2Kt~mC2f8~m9Q6XyGAk632zdI0MelP7eXNoS3hovyWw~UbCtFbxDCrHT4CPxK20p4V4HvILJqKsMIwnSaIJZ5q7XM955mTTYf3kM72T41f7c1YliKx5bR4BHoXL0LvI7~Hp39EWg-nPSRqhTUr6djDyEZAkM4qLQA6ewAqqxNqg9~h9P~IbMhmCdZJYsw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                                width: 150,
                                height: 100,
                                fit: BoxFit.fitWidth),
                            GestureDetector(
                              child: const Text(
                                '<<뒤로',
                                style: TextStyle(
                                    fontSize: 17, color: Color(0xFF3B3B3B)),
                              ),
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
                                Icon(
                                  Icons.edit_location_alt_rounded,
                                  color: Color(0xFF787878),
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
                      children: const [
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '영문 + 숫자 10자 이하',
                          ),
                          controller: tec,
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
              children: const [
                false
                    ? Button(
                        text: 'NEXT',
                        iconshape: Icons.check_circle_outline_outlined,
                        backgroundcolor: Colors.black,
                        textcolor: Colors.white,
                      )
                    : SizedBox(
                        height: 0,
                      ),
                SizedBox(
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
