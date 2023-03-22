import 'package:angel_lanking/api_service.dart';
import 'package:angel_lanking/model/donation2.dart';
import 'package:angel_lanking/model/user.dart';
import 'package:flutter/material.dart';

class Profile_inner extends StatefulWidget {
  final String name;
  final String image;
  final int index;
  final int money;
  final List userlist;
  final List donationlist;
  final List<DonationModel2> getDonationdata;
  const Profile_inner({
    super.key,
    required this.name,
    required this.userlist,
    required this.image,
    required this.donationlist,
    required this.getDonationdata,
    required this.index,
    required this.money,
  });

  @override
  State<Profile_inner> createState() => _Profile_innerState();
}

class _Profile_innerState extends State<Profile_inner> {
  late Future<int>? donationpoint;

  late Future<UserModel>? usermodel1;
  late Future<UserModel>? usermodel2;
  late Future<UserModel>? usermodel3;

  @override
  void initState() {
    super.initState();
    donationpoint = getDonationPointdata(widget.getDonationdata, widget.money);
    if (widget.userlist.isNotEmpty) {
      usermodel1 = ApiService.getUserdata(widget.userlist[0]);
    }
    if (widget.userlist.length > 1) {
      usermodel2 = ApiService.getUserdata(widget.userlist[1]);
    }
    if (widget.userlist.length > 2) {
      usermodel3 = ApiService.getUserdata(widget.userlist[2]);
    }
  }

  static Future<int> getDonationPointdata(
      List<DonationModel2> DonationPointList, num money) async {
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
    Sum += money.toInt();
    return Sum;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1.0,
            color: const Color(0xFFCCCCCC),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network(
                            widget.image,
                            width: 100,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${widget.index}. ${widget.name}',
                              style: const TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                              ),
                            ),
                            Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(
                                    right: 5,
                                    top: 5,
                                  ),
                                  child: Icon(
                                    Icons.circle,
                                    size: 10,
                                    color: Color(0xFF007913),
                                  ),
                                ),
                                Text(
                                  '대학교',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0xFF464646),
                                  ),
                                ),
                              ],
                            ),
                            FutureBuilder(
                                future: donationpoint,
                                builder: ((context, scoreSnapshot) {
                                  if (scoreSnapshot.hasData) {
                                    return Text(
                                      '총 기부금 : ${ApiService.money_f.format(scoreSnapshot.data)}원',
                                      style: const TextStyle(
                                        fontSize: 10,
                                        color: Color(0xFF464646),
                                      ),
                                    );
                                  } else {
                                    return Container();
                                  }
                                })),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text('기부천사 TOP3'),
              ),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: (widget.userlist.isNotEmpty)
                        ? FutureBuilder(
                            future: usermodel1,
                            builder: (context, snapshot1) {
                              if (snapshot1.hasData) {
                                return Column(
                                  children: [
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 30, horizontal: 15),
                                        child: Column(
                                          children: [
                                            Image.network(
                                              'https://dogmbti.s3.ap-northeast-2.amazonaws.com/1004_lanking/%EC%B2%9C%EC%82%AC%EB%9E%AD%ED%82%B9+%EB%A1%9C%EA%B3%A0-003.png',
                                              width: 55,
                                              height: 30,
                                              fit: BoxFit.fitWidth,
                                            ),
                                            Image.network(
                                              'https://dogmbti.s3.ap-northeast-2.amazonaws.com/1004_lanking/${snapshot1.data!.tier}.png',
                                              width: 120,
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Text('1.${snapshot1.data!.name}'),
                                  ],
                                );
                              }
                              return Container();
                            })
                        : const Icon(Icons.data_object),
                  ),
                  Flexible(
                    flex: 1,
                    child: (widget.userlist.length > 1)
                        ? FutureBuilder(
                            future: usermodel2,
                            builder: (context, snapshot2) {
                              if (snapshot2.hasData) {
                                return Column(
                                  children: [
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 30, horizontal: 15),
                                        child: Column(
                                          children: [
                                            Image.network(
                                              'https://dogmbti.s3.ap-northeast-2.amazonaws.com/1004_lanking/%EC%B2%9C%EC%82%AC%EB%9E%AD%ED%82%B9+%EB%A1%9C%EA%B3%A0-003.png',
                                              width: 55,
                                              height: 30,
                                              fit: BoxFit.fitWidth,
                                            ),
                                            Image.network(
                                              'https://dogmbti.s3.ap-northeast-2.amazonaws.com/1004_lanking/${snapshot2.data!.tier}.png',
                                              width: 120,
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Text('2.${snapshot2.data!.name}'),
                                  ],
                                );
                              }
                              return Container();
                            })
                        : const Center(
                            child: Icon(
                              Icons.no_accounts_outlined,
                              size: 70,
                              color: Color.fromARGB(255, 215, 215, 215),
                            ),
                          ),
                  ),
                  Flexible(
                    flex: 1,
                    child: (widget.userlist.length > 2)
                        ? FutureBuilder(
                            future: usermodel3,
                            builder: (context, snapshot3) {
                              if (snapshot3.hasData) {
                                return Column(
                                  children: [
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 30, horizontal: 15),
                                        child: Column(
                                          children: [
                                            Image.network(
                                              'https://dogmbti.s3.ap-northeast-2.amazonaws.com/1004_lanking/%EC%B2%9C%EC%82%AC%EB%9E%AD%ED%82%B9+%EB%A1%9C%EA%B3%A0-003.png',
                                              width: 55,
                                              height: 30,
                                              fit: BoxFit.fitWidth,
                                            ),
                                            Image.network(
                                              'https://dogmbti.s3.ap-northeast-2.amazonaws.com/1004_lanking/${snapshot3.data!.tier}.png',
                                              width: 120,
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Text('3.${snapshot3.data!.name}'),
                                  ],
                                );
                              }
                              return Container();
                            })
                        : const Center(
                            child: Icon(
                              Icons.no_accounts_outlined,
                              size: 70,
                              color: Color.fromARGB(255, 215, 215, 215),
                            ),
                          ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
