import 'package:angel_lanking/api_service.dart';
import 'package:angel_lanking/model/donation.dart';
import 'package:angel_lanking/model/donation2.dart';
import 'package:angel_lanking/model/user.dart';
import 'package:angel_lanking/screen/Home.dart';
import 'package:angel_lanking/widget/Banner.dart';
import 'package:angel_lanking/widget/Lanking.dart';
import 'package:angel_lanking/widget/Website.dart';
import 'package:flutter/material.dart';

class Home_1 extends StatefulWidget {
  final String userID;
  final List donationList;
  final int my_group;
  final List<DonationModel2> getDonationdata;

  const Home_1({
    super.key,
    required this.userID,
    required this.donationList,
    required this.my_group,
    required this.getDonationdata,
  });

  @override
  State<Home_1> createState() => _Home_1State();
}

class _Home_1State extends State<Home_1> {
  late Future<UserModel>? usermodel;
  late Future<int>? donationpoint;
  late Future<List<DonationModel>> getDonationdata;

  int total = 100000000;

  static Future<int> getDonationPointdata(
      List<DonationModel2> DonationGroupList) async {
    late int Sum = 0;

    for (int i = 0; i < DonationGroupList.length; i++) {
      if (DonationGroupList[i].pass) {
        Sum += DonationGroupList[i].money;
      }
    }
    return Sum;
  }

  @override
  void initState() {
    super.initState();
    usermodel = ApiService.getUserdata(widget.userID);
    donationpoint = getDonationPointdata(widget.getDonationdata);
    getDonationdata = ApiService.getDonationdata(widget.donationList);
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
                          lank: '실버 III 80%',
                          point: 0,
                          cost: snapshotpoint.data!,
                          total: total,
                          userID: widget.userID,
                          donationList: widget.donationList,
                        );
                      }
                      return Lanking(
                        name: '...',
                        group: '...',
                        lank: '...',
                        point: 0,
                        cost: 1000,
                        total: 2000,
                        userID: widget.userID,
                        donationList: widget.donationList,
                      );
                    });
              }
              return Lanking(
                name: '...',
                group: '...',
                lank: '...',
                point: 0,
                cost: 1000,
                total: 2000,
                userID: widget.userID,
                donationList: widget.donationList,
              );
            })),
        const Banners(
          image:
              'https://dogmbti.s3.ap-northeast-2.amazonaws.com/1004_lanking/banner1.png',
          link:
              'https://www.unicef.or.kr/?trackcode=g_kad&utm_source=google&utm_medium=cpc&utm_term=%EC%9C%A0%EB%8B%88%EC%84%B8%ED%94%84&utm_campaign=brand&mac_ad_key=2011231204&gclid=CjwKCAiAuOieBhAIEiwAgjCvcpulhoe0KN_F6Ho3eb21KIsVIPw4xyEuyGb-F6_KtP8WmbvQveYFQBoCIyEQAvD_BwE',
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
                          left: 5,
                        ),
                        child: Text(
                          '이번주 기업랭킹',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const Company_Lanking(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Container(
                          height: 1,
                          color: Colors.black,
                        ),
                      ),
                      const Company_Lanking(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Container(
                          height: 1,
                          color: Colors.black,
                        ),
                      ),
                      const Company_Lanking(),
                    ],
                  ),
                ),
              ),
            ),
            FutureBuilder(
              future: getDonationdata,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((BuildContext context) => Home(
                                page: 2,
                                search_group: 3,
                                userID: widget.userID,
                                donationList: widget.donationList,
                                my_group: 0,
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
                  );
                }
                return Container();
              },
            ),
          ],
        ),
        const Banners(
          image:
              'https://dogmbti.s3.ap-northeast-2.amazonaws.com/1004_lanking/banner2.png',
          link:
              'https://www.childfund.or.kr/regularSpon/regular.do?utm_medium=cpc&utm_source=google&utm_campaign=g_search_pc&utm_content=&utm_term=%EC%96%B4%EB%A6%B0%EC%9D%B4%EC%9E%AC%EB%8B%A8&gclid=CjwKCAiAuOieBhAIEiwAgjCvchPLjHz30pKGLtNtR2HQclRkLAiC7TT4RYdHmo-fvsH7F4I0-30SqxoCaBYQAvD_BwE',
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
                          left: 5,
                        ),
                        child: Text(
                          '이번주 기업랭킹',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const Company_Lanking(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Container(
                          height: 1,
                          color: Colors.black,
                        ),
                      ),
                      const Company_Lanking(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Container(
                          height: 1,
                          color: Colors.black,
                        ),
                      ),
                      const Company_Lanking(),
                    ],
                  ),
                ),
              ),
            ),
            FutureBuilder(
              future: getDonationdata,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GestureDetector(
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
                  );
                }
                return Container();
              },
            )
          ],
        ),
        const Banners(
          image:
              'https://dogmbti.s3.ap-northeast-2.amazonaws.com/1004_lanking/banner3.png',
          link: 'https://chest.or.kr/base.do',
        ),
        const Website(),
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
                          left: 5,
                        ),
                        child: Text(
                          '이번주 기업랭킹',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const Company_Lanking(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Container(
                          height: 1,
                          color: Colors.black,
                        ),
                      ),
                      const Company_Lanking(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Container(
                          height: 1,
                          color: Colors.black,
                        ),
                      ),
                      const Company_Lanking(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Company_Lanking extends StatelessWidget {
  const Company_Lanking({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            '1',
            style: TextStyle(
              fontSize: 13,
              color: Colors.black,
            ),
          ),
          const Text(
            '삼성',
            style: TextStyle(
              fontSize: 13,
              color: Colors.black,
            ),
          ),
          Image.network(
            'https://dogmbti.s3.ap-northeast-2.amazonaws.com/1004_lanking/silver.png',
            width: 30,
            fit: BoxFit.fitWidth,
          ),
          Row(
            children: const [
              Text(
                '총 기부금 1000,000원',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '총 기부점수 4,231점',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
