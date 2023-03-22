import 'package:angel_lanking/api_service.dart';
import 'package:angel_lanking/model/donation2.dart';
import 'package:angel_lanking/model/groupuser.dart';
import 'package:angel_lanking/model/user.dart';
import 'package:angel_lanking/screen/Home.dart';
import 'package:angel_lanking/widget/Banner.dart';
import 'package:angel_lanking/widget/Lanking.dart';
import 'package:angel_lanking/widget/Website.dart';
import 'package:flutter/material.dart';

class Home_1 extends StatefulWidget {
  final String userID;
  final String user_group;
  final List donationList;
  final int my_group;
  final int used_money;
  final List<DonationModel2> getDonationdata;

  const Home_1({
    super.key,
    required this.userID,
    required this.donationList,
    required this.my_group,
    required this.used_money,
    required this.getDonationdata,
    required this.user_group,
  });

  @override
  State<Home_1> createState() => _Home_1State();
}

class _Home_1State extends State<Home_1> {
  late Future<UserModel>? usermodel;
  //late Future<List<DonationModel>> getDonationdata2;
  late Future<List<dynamic>>? donationpoint;
  late Future<GroupUserModel> groupusers;
  late Future<List<GroupUserModel>>? grouplistmodel;
  @override
  void initState() {
    super.initState();
    usermodel = ApiService.getUserdata(widget.userID);
    donationpoint = ApiService.getDonationPointdata(
        widget.getDonationdata, widget.used_money);
    //getDonationdata = ApiService.getDonationdata(widget.donationList);
    groupusers = ApiService.getGroupUser(widget.user_group);
    grouplistmodel = ApiService.getGroupList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
            future: usermodel,
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return FutureBuilder(
                    future: donationpoint,
                    builder: (context, snapshotpoint) {
                      if (snapshotpoint.hasData) {
                        return Lanking(
                          name: snapshot.data!.name,
                          group: snapshot.data!.group,
                          lank: snapshotpoint.data![1],
                          point: 0,
                          cost: snapshotpoint.data![0],
                          end: snapshotpoint.data![3],
                          start: snapshotpoint.data![2],
                          userID: widget.userID,
                          donationList: widget.donationList,
                          persent: snapshotpoint.data![4],
                          getDonationdata: widget.getDonationdata,
                          my_group: widget.my_group,
                          lastlank: snapshot.data!.tier,
                        );
                      }
                      return Lanking(
                        name: '...',
                        group: '...',
                        lank: '...',
                        point: 0,
                        cost: 1000,
                        end: 2000,
                        start: 0,
                        userID: widget.userID,
                        donationList: widget.donationList,
                        persent: 0,
                        getDonationdata: widget.getDonationdata,
                        my_group: widget.my_group,
                        lastlank: '...',
                      );
                    });
              }
              return Lanking(
                name: '...',
                group: '...',
                lank: '...',
                point: 0,
                cost: 1000,
                end: 2000,
                start: 0,
                userID: widget.userID,
                donationList: widget.donationList,
                persent: 0,
                getDonationdata: widget.getDonationdata,
                my_group: widget.my_group,
                lastlank: '...',
              );
            })),
        const Banners(
          image:
              'https://dogmbti.s3.ap-northeast-2.amazonaws.com/1004_lanking/banner1.png',
          link: 'https://www.unicef.or.kr/',
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
              ),
              child: Container(
                alignment: Alignment.topLeft,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFE6E6E6),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 10,
                    right: 10,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 15,
                          top: 5,
                          left: 10,
                        ),
                        child: Text(
                          '${widget.user_group} 랭킹',
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      FutureBuilder(
                        future: groupusers,
                        builder: ((context, groupSnapshot) {
                          if (groupSnapshot.hasData) {
                            return Column(
                              children: [
                                for (var group in groupSnapshot.data!.user)
                                  if (groupSnapshot.data!.user.indexOf(group) <
                                      5)
                                    Column(
                                      children: [
                                        (groupSnapshot.data!.user
                                                    .indexOf(group) !=
                                                0)
                                            ? Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 20,
                                                ),
                                                child: Container(
                                                  height: 1,
                                                  color: Colors.grey,
                                                ),
                                              )
                                            : Container(),
                                        Main_Lanking(
                                            userID: group,
                                            index: groupSnapshot.data!.user
                                                    .indexOf(group) +
                                                1),
                                      ],
                                    ),
                              ],
                            );
                          }
                          return Container();
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((BuildContext context) => Home(
                          page: 2,
                          search_group: 1,
                          userID: widget.userID,
                          donationList: widget.donationList,
                          my_group: 0,
                          user_group: widget.user_group,
                        )),
                    fullscreenDialog: true,
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 10,
                  left: 10,
                  right: 10,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFF3F3F3),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 13),
                        child: Text(
                          '자세히 보기',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        size: 20,
                      ),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const Banners(
          image:
              'https://dogmbti.s3.ap-northeast-2.amazonaws.com/1004_lanking/banner2.png',
          link: 'https://www.childfund.or.kr/regularSpon/regular.do',
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
              ),
              child: Container(
                alignment: Alignment.topLeft,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFE6E6E6),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 10,
                    right: 10,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          bottom: 15,
                          top: 5,
                          left: 10,
                        ),
                        child: Text(
                          '단체별 랭킹',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      FutureBuilder(
                        future: grouplistmodel,
                        builder: ((context, groupSnapshot) {
                          if (groupSnapshot.hasData) {
                            return Column(
                              children: [
                                for (var group in groupSnapshot.data!)
                                  if (groupSnapshot.data!.indexOf(group) < 5)
                                    Column(
                                      children: [
                                        (groupSnapshot.data!.indexOf(group) !=
                                                0)
                                            ? Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 20,
                                                ),
                                                child: Container(
                                                  height: 1,
                                                  color: Colors.grey,
                                                ),
                                              )
                                            : Container(),
                                        Main_Lanking_score(
                                            donationList: group.donation,
                                            user_name: group.name,
                                            index: (groupSnapshot.data!
                                                        .indexOf(group) +
                                                    1)
                                                .toString(),
                                            used_money: group.money),
                                      ],
                                    ),
                              ],
                            );
                          }
                          return Container();
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((BuildContext context) => Home(
                          page: 2,
                          search_group: 1,
                          userID: widget.userID,
                          donationList: widget.donationList,
                          my_group: 0,
                          user_group: widget.user_group,
                        )),
                    fullscreenDialog: true,
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 10,
                  left: 10,
                  right: 10,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFF3F3F3),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 13),
                        child: Text(
                          '자세히 보기',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        size: 20,
                      ),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const Banners(
          image:
              'https://dogmbti.s3.ap-northeast-2.amazonaws.com/1004_lanking/banner3.png',
          link: 'https://chest.or.kr/base.do',
        ),
        const Website(),
      ],
    );
  }
}

class Main_Lanking extends StatefulWidget {
  final String userID;
  final int index;
  const Main_Lanking({
    Key? key,
    required this.userID,
    required this.index,
  }) : super(key: key);

  @override
  State<Main_Lanking> createState() => _Main_LankingState();
}

class _Main_LankingState extends State<Main_Lanking> {
  late Future<UserModel>? usermodel;
  //late Future<List<DonationModel>> getDonationdata2;
  @override
  void initState() {
    super.initState();
    usermodel = ApiService.getUserdata(widget.userID);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: usermodel,
      builder: ((context, userSnapshot) {
        if (userSnapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            child: Main_Lanking_score(
              donationList: userSnapshot.data!.donation,
              index: widget.index.toString(),
              user_name: userSnapshot.data!.name,
              used_money: userSnapshot.data!.used_money,
            ),
          );
        }
        return Container();
      }),
    );
  }
}

class Main_Lanking_score extends StatefulWidget {
  final List<dynamic> donationList;
  final String user_name;
  final String index;
  final int used_money;
  const Main_Lanking_score(
      {Key? key,
      required this.donationList,
      required this.user_name,
      required this.index,
      required this.used_money})
      : super(key: key);

  @override
  State<Main_Lanking_score> createState() => _Main_Lanking_scoreState();
}

class _Main_Lanking_scoreState extends State<Main_Lanking_score> {
  late Future<List<DonationModel2>>? getDonationdata;

  @override
  void initState() {
    super.initState();
    getDonationdata = ApiService.getDonationdata2(widget.donationList);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getDonationdata,
      builder: (context, snapshot2) {
        if (snapshot2.hasData) {
          return Main_Lanking_makeList(
            donationList: snapshot2.data!,
            user_name: widget.user_name,
            index: widget.index,
            used_money: widget.used_money,
          );
        }
        return Container();
      },
    );
  }
}

class Main_Lanking_makeList extends StatefulWidget {
  final List<DonationModel2> donationList;
  final String user_name;
  final String index;
  final int used_money;
  const Main_Lanking_makeList({
    Key? key,
    required this.donationList,
    required this.user_name,
    required this.index,
    required this.used_money,
  }) : super(key: key);

  @override
  State<Main_Lanking_makeList> createState() => _Main_Lanking_makeListState();
}

class _Main_Lanking_makeListState extends State<Main_Lanking_makeList> {
  late Future<List<dynamic>>? getDonationdata;

  @override
  void initState() {
    super.initState();
    getDonationdata =
        ApiService.getDonationPointdata(widget.donationList, widget.used_money);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Row(
                children: [
                  Text(
                    '${widget.index}. ',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    widget.user_name,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
          FutureBuilder(
            future: getDonationdata,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SizedBox(
                  width: 160,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.network(
                        'https://dogmbti.s3.ap-northeast-2.amazonaws.com/1004_lanking/silver.png',
                        width: 30,
                        fit: BoxFit.fitWidth,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        '총 기부금 : ${ApiService.money_f.format(snapshot.data![0])}원',
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
