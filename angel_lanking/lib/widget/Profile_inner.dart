import 'package:angel_lanking/model/donation2.dart';
import 'package:flutter/material.dart';

class Profile_inner extends StatefulWidget {
  final String name;
  final String image;
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
  });

  @override
  State<Profile_inner> createState() => _Profile_innerState();
}

class _Profile_innerState extends State<Profile_inner> {
  late Future<int>? donationpoint;

  @override
  void initState() {
    super.initState();
    donationpoint = getDonationPointdata(widget.getDonationdata);
  }

  static Future<int> getDonationPointdata(
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
          child: Row(
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
                        width: 60,
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
                          '1. ${widget.name}',
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
                                  '총 기부금 : ${scoreSnapshot.data}원',
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
        ),
      ),
    );
  }
}
