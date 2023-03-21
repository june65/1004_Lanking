import 'package:angel_lanking/screen/Donation_detail.dart';
import 'package:angel_lanking/screen/Home.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Coin_donation extends StatelessWidget {
  final String userID;
  final int money;
  final int used_money;
  final String user_group;
  final List donationList;
  Coin_donation({
    super.key,
    required this.userID,
    required this.money,
    required this.used_money,
    required this.user_group,
    required this.donationList,
  });

  String group = '';

  late String user_id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      /*
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 12, 10, 10),
        title: const Text('기부 점수 올리기'),
      ),
      backgroundColor: const Color.fromARGB(255, 12, 10, 10),
      */
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((BuildContext context) => Home(
                                      page: 3,
                                      search_group: 1,
                                      userID: userID,
                                      donationList: donationList,
                                      my_group: 0,
                                      user_group: user_group,
                                    )),
                                fullscreenDialog: true,
                              ),
                            );
                          },
                          child: const Icon(
                            Icons.close,
                            color: Color(0xFF666666),
                            size: 30,
                          ),
                        ),
                        Image.network(
                          'https://dogmbti.s3.ap-northeast-2.amazonaws.com/1004_lanking/main_logo.png',
                          width: 120,
                          height: 60,
                          fit: BoxFit.fitWidth,
                        ),
                        const Icon(
                          Icons.notifications_none_outlined,
                          color: Color(0xFF666666),
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 20,
                            left: 10.0,
                            right: 10,
                            bottom: 20,
                          ),
                          child: Text(
                            '환전하기',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (await canLaunchUrl(
                                Uri.parse('https://kko.to/eK9zUkVuSn'))) {
                              await launchUrl(
                                  Uri.parse('https://kko.to/eK9zUkVuSn'),
                                  mode: LaunchMode.externalApplication);
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Image.network(
                                    'https://dogmbti.s3.ap-northeast-2.amazonaws.com/1004_lanking/Group+55+(1).png',
                                    width: 80,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      '효율적인 기부',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xff9a9a9a)),
                                    ),
                                    Text(
                                      '천사머니 구매하기',
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20,
                      bottom: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 20,
                            left: 10.0,
                            right: 10,
                            bottom: 20,
                          ),
                          child: Text(
                            '기부점수 올리기',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((BuildContext context) =>
                                    Donation_detail(
                                      userID: userID,
                                      money: money,
                                      used_money: used_money,
                                      user_group: user_group,
                                      donationList: donationList,
                                    )),
                                fullscreenDialog: false,
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Image.network(
                                    'https://dogmbti.s3.ap-northeast-2.amazonaws.com/1004_lanking/fcce4feadbebb425ef2fd860c46d5857.png',
                                    width: 80,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      '간편하게 기부',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xff9a9a9a)),
                                    ),
                                    Text(
                                      '자동으로 등록하기',
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await launchUrlString(
                                'https://happybean.naver.com/');
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Image.network(
                                    'https://dogmbti.s3.ap-northeast-2.amazonaws.com/1004_lanking/bcb122649a190cc41f153c9cdd42771f.png',
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      '플랫폼 기부',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xff9a9a9a)),
                                    ),
                                    Text(
                                      '해피빈에 기부하기 ',
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await launchUrlString(
                                'https://www.childfund.or.kr/main.do');
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Image.network(
                                    'https://dogmbti.s3.ap-northeast-2.amazonaws.com/1004_lanking/8c70629ca3f4831b7a864b1bba0e30cc.png',
                                    width: 80,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      '재단 기부',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xff9a9a9a)),
                                    ),
                                    Text(
                                      '어린이재단에 기부하기',
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await launchUrlString('https://www.unicef.or.kr/');
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Image.network(
                                    'https://dogmbti.s3.ap-northeast-2.amazonaws.com/1004_lanking/06e04a1f27843243655d37942173c8ed.png',
                                    height: 80,
                                    width: 80,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      '재단 기부',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xff9a9a9a)),
                                    ),
                                    Text(
                                      '유니셰프에 기부하기',
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((BuildContext context) =>
                                    Donation_detail(
                                      userID: userID,
                                      money: money,
                                      used_money: used_money,
                                      user_group: user_group,
                                      donationList: donationList,
                                    )),
                                fullscreenDialog: false,
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Image.network(
                                    'https://dogmbti.s3.ap-northeast-2.amazonaws.com/1004_lanking/finder_logo.png',
                                    width: 80,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      '간편하게 기부',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xff9a9a9a)),
                                    ),
                                    Text(
                                      '천사랭킹에 기부하기',
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
