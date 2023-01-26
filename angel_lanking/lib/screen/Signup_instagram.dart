import 'package:angel_lanking/screen/Home.dart';
import 'package:angel_lanking/screen/Signup_group.dart';
import 'package:angel_lanking/widget/Button.dart';
import 'package:flutter/material.dart';

class Signup_instagram extends StatefulWidget {
  const Signup_instagram({super.key});

  @override
  State<Signup_instagram> createState() => _Signup_instagramState();
}

class _Signup_instagramState extends State<Signup_instagram> {
  //TextEditingController tec = TextEditingController();

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
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((BuildContext context) =>
                                        const Signup_group()),
                                    fullscreenDialog: true,
                                  ),
                                );
                              },
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
                                  Icons.beenhere_rounded,
                                  color: Color(0xFFFEFEFE),
                                ),
                                Icon(
                                  Icons.beenhere_rounded,
                                  color: Color(0xFFFEFEFE),
                                ),
                                Hero(
                                  tag: 'location_icon',
                                  child: Icon(
                                    Icons.edit_location_alt_rounded,
                                    color: Color(0xFF787878),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
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
                                Icon(
                                  Icons.circle,
                                  size: 15,
                                  color: Color(0xFF787878),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 20,
                        ),
                        child: Column(
                          children: const [
                            Text(
                              '인스타 계정을 입력해주세요',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              '(event 공지/발표)',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
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
                            labelText: '@instagram_id',
                          ),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((BuildContext context) => const Home()),
                              fullscreenDialog: true,
                            ),
                          );
                        },
                        child: const Button(
                          text: 'NEXT',
                          iconshape: Icons.check_circle_outline_outlined,
                          backgroundcolor: Colors.black,
                          textcolor: Colors.white,
                        ),
                      )
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
