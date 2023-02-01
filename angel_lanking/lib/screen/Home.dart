import 'package:angel_lanking/screen/Home_1.dart';
import 'package:angel_lanking/screen/Home_2.dart';
import 'package:angel_lanking/screen/Home_3.dart';
import 'package:angel_lanking/screen/Home_4.dart';
import 'package:angel_lanking/screen/Signup_group.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _number = value;
          });
        },
        currentIndex: _number,
        selectedItemColor: Colors.black,
        unselectedItemColor: const Color(0xFFBBBBBB),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _number == 0
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
            icon: _number == 1
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
            icon: _number == 2
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
            icon: _number == 3
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
                _number == 0 ? const Home_1() : Column(),
                _number == 1 ? const Home_2() : Column(),
                _number == 2 ? const Home_3() : Column(),
                _number == 3 ? const Home_4() : Column(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
