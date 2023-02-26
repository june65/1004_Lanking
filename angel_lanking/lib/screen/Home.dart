import 'package:angel_lanking/api_service.dart';
import 'package:angel_lanking/model/donation2.dart';
import 'package:angel_lanking/screen/Home_1.dart';
import 'package:angel_lanking/screen/Home_2.dart';
import 'package:angel_lanking/screen/Home_3.dart';
import 'package:angel_lanking/screen/Home_4.dart';
import 'package:angel_lanking/screen/Signup_group.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final int page;
  final int search_group;
  final int my_group;
  final String userID;
  final List donationList;

  const Home({
    super.key,
    required this.page,
    required this.search_group,
    required this.my_group,
    required this.userID,
    required this.donationList,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<DonationModel2>> getDonationdata;
  var page_number = 0;
  var search_group_ = 1;

  @override
  void initState() {
    super.initState();
    page_number = widget.page;
    search_group_ = widget.search_group;
    getDonationdata = ApiService.getDonationdata2(widget.donationList);
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
                          'https://dogmbti.s3.ap-northeast-2.amazonaws.com/1004_lanking/main_logo.png',
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
                                            Signup_group(
                                              user_id_save: 'user_id_save',
                                              userID: widget.userID,
                                            )),
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
                  page_number == 0
                      ? FutureBuilder(
                          future: getDonationdata,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Home_1(
                                userID: widget.userID,
                                donationList: widget.donationList,
                                getDonationdata: snapshot.data!,
                                my_group: 0,
                              );
                            }
                            return Container();
                          },
                        )
                      : Column(),
                  page_number == 1
                      ? const Home_2(
                          my_group: 0,
                        )
                      : Column(),
                  page_number == 2
                      ? Home_3(
                          search_group: search_group_,
                          my_group: 0,
                        )
                      : Column(),
                  page_number == 3
                      ? FutureBuilder(
                          future: getDonationdata,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Home_4(
                                userID: widget.userID,
                                donationList: widget.donationList,
                                getDonationdata: snapshot.data!,
                                my_group: widget.my_group,
                              );
                            }
                            return Container();
                          },
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
}
