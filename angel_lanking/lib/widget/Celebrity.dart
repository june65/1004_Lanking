import 'package:angel_lanking/model/donation2.dart';
import 'package:flutter/material.dart';

class Celebrity extends StatelessWidget {
  final String name;
  final String group;
  final String lank;
  final String point;
  final String cost;
  final int start;
  final int end;
  final String image;
  final String userID;
  final List donationList;
  final List<DonationModel2> getDonationdata;

  const Celebrity({
    super.key,
    required this.name,
    required this.group,
    required this.lank,
    required this.point,
    required this.cost,
    required this.start,
    required this.end,
    required this.image,
    required this.userID,
    required this.donationList,
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
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.network(
                      image,
                      width: 120,
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
                          Column(
                            children: [
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
                                      color: Color.fromARGB(255, 255, 209, 41),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        point,
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: Color(0xFF464646),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
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
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            lank,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Color(0xFF464646),
                            ),
                          ),
                          Text(
                            '( $cost)',
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
                                    flex: 1,
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
                                            Color.fromARGB(255, 0, 0, 0),
                                            Color.fromARGB(255, 180, 180, 180),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 0,
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
                                '총 기부금 : $cost달러',
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
            ],
          ),
        ),
      ),
    );
  }
}
