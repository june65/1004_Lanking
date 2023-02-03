import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Website extends StatelessWidget {
  const Website({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await launchUrlString(
            'https://1004lanking.notion.site/0efa505f492845f7843d5af203f0a5bd');
      },
      child: Padding(
        padding: const EdgeInsets.all(
          10,
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
                    const Text(
                      '천사 발굴단의 성과',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const [
                        Text(
                          '구경하기',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          size: 15,
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
