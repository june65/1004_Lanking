import 'package:angel_lanking/screen/Signup_name.dart';
import 'package:flutter/material.dart';

class Lanking extends StatelessWidget {
  final String name;
  final String group;
  final String lank;
  final int point;
  final int cost;
  final int total;

  const Lanking({
    super.key,
    required this.name,
    required this.group,
    required this.lank,
    required this.point,
    required this.cost,
    required this.total,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.network(
                    'https://s3-alpha-sig.figma.com/img/0be0/b0e2/b67cb9c335a01b78054b2fbd871abdc7?Expires=1676246400&Signature=CMkVzxdNOohddis6UwfnNFSLsv5Hk8ToPDisnQwwOaI~1w6JagwAhbSxLSQJ64rX2~31~f8BKIkIa~IxDW1QMI4yoNgzu3HQ50GQdDiRG8jJBbBsg978IjzYb8S9zwyVrRu4CFC2QJ9H6iinT59M~oxI5m3AI8F8HzHQRQ3FYucLrOJ7w-~IE18FplZYw4IAc0kua01UQy-Pgt9I9J51kprjfJvSO6~ux-tTU9fwY6sLR3UWdce6trv0g2K-3o~HnFM9t6N0i7IkS-eaUn8LFUQAbIhWs9ISimH2p4FNo~TDnJnhnd3EKWDuviwBk-V44RIDNbatfBA4REXjLPJawA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
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
                            Text(
                              group,
                              style: const TextStyle(
                                fontSize: 10,
                                color: Color(0xFF464646),
                              ),
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
                          '($cost/$total)',
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
                                  flex: cost,
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
                                  flex: (total - cost),
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
                              '총 기부금 : $cost원',
                              style: const TextStyle(
                                fontSize: 10,
                                color: Color(0xFF464646),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '총 기부점수 :$point점',
                              style: const TextStyle(
                                fontSize: 10,
                                color: Color(0xFF464646),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((BuildContext context) => const Signup_name()),
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
                          '기부 내역을 등록하여 기부티어를 올리세요',
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