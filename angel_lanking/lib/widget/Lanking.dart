import 'package:angel_lanking/model/donation2.dart';
import 'package:angel_lanking/screen/Home.dart';
import 'package:angel_lanking/screen/Tier_image.dart';
import 'package:flutter/material.dart';

class Lanking extends StatelessWidget {
  final String name;
  final String group;
  final String lank;
  final int point;
  final int cost;
  final int start;
  final int end;
  final double persent;
  final String userID;
  final List donationList;
  final int my_group;
  final List<DonationModel2> getDonationdata;

  const Lanking({
    super.key,
    required this.name,
    required this.group,
    required this.lank,
    required this.point,
    required this.cost,
    required this.start,
    required this.end,
    required this.persent,
    required this.userID,
    required this.donationList,
    required this.my_group,
    required this.getDonationdata,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                if (lank != '...') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((BuildContext context) => Tier_image(
                          userID: userID,
                          tier: lank,
                          donationList: donationList,
                          getDonationdata: getDonationdata)),
                      fullscreenDialog: true,
                    ),
                  );
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.network(
                      'https://dogmbti.s3.ap-northeast-2.amazonaws.com/1004_lanking/silver.png',
                      width: 100,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                            ),
                          ),
                          Row(
                            children: [
                              const Padding(
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
                              Column(
                                children: [
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    group,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Color(0xFF464646),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            '$lank  $persent%',
                            style: const TextStyle(
                              fontSize: 13,
                              color: Color(0xFF464646),
                            ),
                          ),
                          Text(
                            '($cost/$end)',
                            style: const TextStyle(
                              fontSize: 10,
                              color: Color(0xFFAEAEAE),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                            ),
                            child: Container(
                              height: 10,
                              width: double.infinity,
                              color: const Color(0xFFC8C8C8),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: (cost - start),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                        ),
                                        gradient: LinearGradient(
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomLeft,
                                          colors: [
                                            Color(0xFF4A4A4A),
                                            Color(0xFFA4A4A4),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: (end - cost),
                                    child: Container(
                                      color: const Color(0xFFC8C8C8),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '??? ????????? : $cost???',
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Color(0xFF464646),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
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
                          my_group: 2,
                          user_group: group,
                        )),
                    fullscreenDialog: true,
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F3F3),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF0047FF),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 7,
                          ),
                          child: Text('UPDATE',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                              )),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 13),
                        child: Text(
                          '?????? ????????? ???????????? ??????????????? ????????????',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.chevron_right,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
