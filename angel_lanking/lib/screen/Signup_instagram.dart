import 'package:angel_lanking/screen/Home.dart';
import 'package:angel_lanking/screen/Signup_group.dart';
import 'package:angel_lanking/widget/Button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signup_instagram extends StatefulWidget {
  final String userID;
  final String user_id_save;
  final String group_save;

  const Signup_instagram({
    super.key,
    required this.user_id_save,
    required this.group_save,
    required this.userID,
  });

  @override
  State<Signup_instagram> createState() => _Signup_instagramState();
}

class _Signup_instagramState extends State<Signup_instagram> {
  late SharedPreferences prefs;

  late String user_id;
  late String group;

  @override
  void initState() {
    super.initState();
    user_id = widget.user_id_save;
    group = widget.group_save;
  }
  /*
  Future save_user_id() async {
    //createData();
    prefs = await SharedPreferences.getInstance();
    await prefs.setString('Login', user_id);
  }
  */

  TextEditingController instagram_id = TextEditingController();
  Color button_color = Colors.grey;

  void button_color_fuction() {
    if (instagram_id.text.length >= 4 &&
        instagram_id.text.replaceAll(RegExp(' '), "") == instagram_id.text) {
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
                                'https://dogmbti.s3.ap-northeast-2.amazonaws.com/1004_lanking/main_logo.png',
                                width: 150,
                                height: 100,
                                fit: BoxFit.fitWidth),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((BuildContext context) =>
                                        Signup_group(
                                          user_id_save: widget.user_id_save,
                                          userID: widget.userID,
                                        )),
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
                              '(EVENT 당첨자 발표)',
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
                      children: [
                        TextField(
                          controller: instagram_id,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '@instagram_id',
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
                        onTap: () async {
                          if (instagram_id.text.length >= 4 &&
                              instagram_id.text.replaceAll(RegExp(' '), "") ==
                                  instagram_id.text) {
                            await FirebaseFirestore.instance
                                .collection('user')
                                .doc(widget.userID)
                                .set({
                              'name': widget.user_id_save,
                              'donation': [],
                              'instagram': instagram_id.text,
                              'group': widget.group_save
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((BuildContext context) => Home(
                                      page: 0,
                                      group: 1,
                                      userID: widget.userID,
                                      donationList: const [''],
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
