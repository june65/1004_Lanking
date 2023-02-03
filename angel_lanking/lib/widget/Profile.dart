import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

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
                        'https://s3-alpha-sig.figma.com/img/c209/e8f9/e3589cb98616324603f0028bedbe3af4?Expires=1676246400&Signature=Y0xGgnKUW~HKJv5oT2bESTq50DwJiCEMC3VL3CWDmRKSWEtuEL8wHFlQoLIRiETrbtzmseoJJU7rYlEyTdJjlGjNvJ6QZp-0oSDx9me0w-Q-ex2zRazbTGXiIhlGPtVLkA4HxFr9iiSC8GSqlhFuXj68fC0EqZRn3jXYtdXZhHXR7q2kgK86f~JnpXHaugiioK2CM36iPpxTYvYaIZegXf9GYArAzc8p1NEikmEvdcx~1ukvv9~s0Q8Nb410qOItNEX48xJL5yoYMpLzDhF7QfB3gaUJTJ6HRhqR1nloWvOQo0k-VGIfXEZWsn42cljQuUZD6nEQCkfQ2pcP8MuEBw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
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
                        const Text(
                          '1. 홍길동',
                          style: TextStyle(
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
                              '초록우산 어린이재단',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xFF464646),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            Text(
                              '총 기부금 : 1,000,000원',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xFF464646),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '총 기부점수 : 3,114점',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xFF464646),
                              ),
                            ),
                          ],
                        ),
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
