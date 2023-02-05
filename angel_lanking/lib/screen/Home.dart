import 'package:angel_lanking/screen/Home_1.dart';
import 'package:angel_lanking/screen/Home_2.dart';
import 'package:angel_lanking/screen/Home_3.dart';
import 'package:angel_lanking/screen/Home_4.dart';
import 'package:angel_lanking/screen/Signup_group.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final int page;
  final int group;
  final String userID;

  const Home({
    super.key,
    required this.page,
    required this.group,
    required this.userID,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var page_number = 0;
  var group_number = 1;

  @override
  void initState() {
    super.initState();
    page_number = widget.page;
    group_number = widget.group;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            page_number = value;
          });
        },
        currentIndex: page_number,
        selectedItemColor: Colors.black,
        unselectedItemColor: const Color(0xFFBBBBBB),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: page_number == 0
                ? const Icon(
                    Icons.home,
                    size: 25,
                  )
                : const Icon(
                    Icons.home_outlined,
                    size: 25,
                  ),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: page_number == 1
                ? const Icon(
                    Icons.local_offer_rounded,
                    size: 25,
                  )
                : const Icon(
                    Icons.local_offer_outlined,
                    size: 25,
                  ),
            label: 'EVENT',
          ),
          BottomNavigationBarItem(
            icon: page_number == 2
                ? const Icon(
                    Icons.search,
                    size: 27,
                  )
                : const Icon(
                    Icons.search,
                    size: 27,
                  ),
            label: 'SEARCH',
          ),
          BottomNavigationBarItem(
            icon: page_number == 3
                ? const Icon(
                    Icons.account_circle,
                    size: 27,
                  )
                : const Icon(
                    Icons.account_circle_outlined,
                    size: 27,
                  ),
            label: 'MY',
          ),
        ],
      ),
      backgroundColor: const Color(0xFFFEFEFE),
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xFFF9F9F9),
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
                        Column(),
                        Image.network(
                          'https://s3-alpha-sig.figma.com/img/6976/fcb3/4c86021c9697c169dc32a088c690cc7b?Expires=1676246400&Signature=g9gIGEs5AiVZIkHTI-Qboh7AGpwje3Pr-B-nCnDQmYkVz3wzQs3df6UBOu9DE35XM2QQfyN1G71PhXLJiaiWHCatb9HTk6ymkeIt6HaAmGTdZfOYY-stbS9LC4YULcQcsoy9trTRswdx2ABObf1nG4~9LoJDI1jiXxXRcUik2z2dXBhhEo8B~p~6Eb419-nuwie~4YejMv09VR4KQnOcwEayS22xBYcMnt3ureyfsFhwNrQgkzpZq6NAkMat8hHdqBI-dtt9d0UID4TPmJRjhq-65bmX4aaTGgaBqCqQqr8ATGPRCkvclTgTYroWqPlL6U5vc9ohipEhxJLfMB2T1g__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                          width: 120,
                          height: 60,
                          fit: BoxFit.fitWidth,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                /*
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
                                  child: const Icon(
                                    Icons.search,
                                    color: Color(0xFF666666),
                                    size: 30,
                                  ),
                                ),
                                */
                                GestureDetector(
                                  onTap: () {
                                    /*Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: ((BuildContext context) =>
                                            const Signup_group(
                                                user_id_save: 'user_id_save')),
                                        fullscreenDialog: true,
                                      ),
                                    );*/
                                  },
                                  child: const Icon(
                                    Icons.notifications_none_outlined,
                                    color: Color(0xFF666666),
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  page_number == 0 ? Home_1(userID: widget.userID) : Column(),
                  page_number == 1 ? const Home_2() : Column(),
                  page_number == 2
                      ? Home_3(
                          group: group_number,
                        )
                      : Column(),
                  page_number == 3
                      ? Home_4(
                          userID: widget.userID,
                        )
                      : Column(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement hashCode
  int get hashCode => super.hashCode;

  @override
  bool operator ==(Object other) {
    // TODO: implement ==
    return super == other;
  }
}
