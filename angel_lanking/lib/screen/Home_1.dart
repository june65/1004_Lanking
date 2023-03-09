import 'package:angel_lanking/api_service.dart';
import 'package:angel_lanking/model/donation2.dart';
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
  final List<DonationModel2> getDonationdata;

  const Home_1({
    super.key,
    required this.userID,
    required this.donationList,
    required this.my_group,
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

  static Future<List<dynamic>> getDonationPointdata(
      List<DonationModel2> DonationPointList) async {
    late int Start = 0;
    late int Final = 0;
    late int Sum = 0;
    late double Persent = 0.0;

    for (int i = 0; i < DonationPointList.length; i++) {
      if (DonationPointList[i].delete) {
        if (DonationPointList[i].pass) {
          Sum += DonationPointList[i].money;
        }
      }
    }

    late String tear = 'unranked';

    if (Sum < 30000) {
      tear = 'Bronze';
      Final = 30000;
      Persent = 92.1;
    } else if (Sum < 100000) {
      tear = 'Silver';
      Start = 30000;
      Final = 100000;
      Persent = 71.3;
    } else if (Sum < 200000) {
      tear = 'Gold';
      Start = 100000;
      Final = 200000;
      Persent = 40.7;
    } else if (Sum < 500000) {
      tear = 'Platinum';
      Start = 200000;
      Final = 500000;
      Persent = 10.7;
    } else if (Sum < 1000000) {
      tear = 'Diamond';
      Start = 500000;
      Final = 1000000;
      Persent = 5.7;
    } else {
      tear = 'Master';
      Start = 1000000;
      Final = 1000000;
      Persent = 1.7;
    }
    return [Sum, tear, Start, Final, Persent];
  }

  @override
  void initState() {
    super.initState();
    usermodel = ApiService.getUserdata(widget.userID);
    donationpoint = getDonationPointdata(widget.getDonationdata);
    //getDonationdata = ApiService.getDonationdata(widget.donationList);
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
            GestureDetector(
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
