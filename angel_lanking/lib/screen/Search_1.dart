import 'package:flutter/material.dart';

class Search_1 extends StatelessWidget {
  const Search_1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                //Outline border type for TextFeild
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              labelText: '아이디 ex) 1004_lanking',
            ),
          ),
        ),
        Friend(cost: 800, total: 1000),
        Friend(cost: 800, total: 1000),
        Friend(cost: 800, total: 1000),
        Friend(cost: 800, total: 1000),
        Friend(cost: 800, total: 1000),
      ],
    );
  }
}

class Friend extends StatelessWidget {
  final int cost;
  final int total;

  const Friend({
    super.key,
    required this.cost,
    required this.total,
  });

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
          border: Border.all(
            width: 1.0,
            color: const Color(0xFFCCCCCC),
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.network(
                      'https://s3-alpha-sig.figma.com/img/0be0/b0e2/b67cb9c335a01b78054b2fbd871abdc7?Expires=1676246400&Signature=CMkVzxdNOohddis6UwfnNFSLsv5Hk8ToPDisnQwwOaI~1w6JagwAhbSxLSQJ64rX2~31~f8BKIkIa~IxDW1QMI4yoNgzu3HQ50GQdDiRG8jJBbBsg978IjzYb8S9zwyVrRu4CFC2QJ9H6iinT59M~oxI5m3AI8F8HzHQRQ3FYucLrOJ7w-~IE18FplZYw4IAc0kua01UQy-Pgt9I9J51kprjfJvSO6~ux-tTU9fwY6sLR3UWdce6trv0g2K-3o~HnFM9t6N0i7IkS-eaUn8LFUQAbIhWs9ISimH2p4FNo~TDnJnhnd3EKWDuviwBk-V44RIDNbatfBA4REXjLPJawA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                      width: 80,
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
                          const Text(
                            '1. 홍길동',
                            style: TextStyle(
                              fontSize: 15,
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
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            '실버 III 97.5%',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF464646),
                            ),
                          ),
                          const Text(
                            '(721,322/1,012,341)',
                            style: TextStyle(
                              fontSize: 10,
                              color: Color(0xFFAEAEAE),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 2,
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
