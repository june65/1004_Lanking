import 'package:angel_lanking/screen/Signup_name.dart';
import 'package:angel_lanking/widget/Banner.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Home_1 extends StatefulWidget {
  const Home_1({super.key});

  @override
  State<Home_1> createState() => _Home_1State();
}

class _Home_1State extends State<Home_1> {
  var total = 1000;
  var cost = 800;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
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
                            const Text(
                              '홍길동',
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
                            const SizedBox(
                              height: 15,
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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((BuildContext context) =>
                            const Signup_name()),
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
        ),
        const Banners(
          image:
              'https://s3-alpha-sig.figma.com/img/193c/1c74/7ba0c7ab9652ef2a73a472fa92be27c5?Expires=1676246400&Signature=PhowIt~jW990RH~j07d-WR8351Dxk46HJVF5EyymdUo9JudtU~UyoJ0gyK6D6~YF2Oa3uAszGO2qDJFKxm7ZV0XpJik-cW~Pa73vO~2uLVFKZGk2Msy3iojJLtKPfLC8duX~-OF0Lj90LoRQ5sYlCE0X6SH0J6Sra7j4Hz~Uxmf6uMjttSdRlWXzBpgXob~Q3-x3BPBrcSVaRVRRGpeITdELCx1k0zYQRiEz~cJna7OiI9U9cZ8JDgu8MlfCTXGP3JMuovDK3r3lRWcrAJZMrDhnDV2oPSuEUiO9eJYfsdNu2vGnQTNQ5mAsmtYbUCVW3PBfWETcNt49QZWf6JnaAg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
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
                    builder: ((BuildContext context) => const Signup_name()),
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
              'https://s3-alpha-sig.figma.com/img/da90/e846/a7e1b1b8c9ad4b975803da1cd83f7bc5?Expires=1676246400&Signature=l6zl4t5KRDCyYMlEg7hIuUEgCRxW36vKe3RlqHAIc4S4q4ncNn1QV4ZRvWXCJntB7xViBJ4vYdTtDRhPFo1b4xXEYghzcO6I--OMU584Jp4~MxMm2zHAW2RXS3y-IRymlum4uPoO1H1weQxsjeTnkPX0MLDjPL~hCQ9eFY~UJ~dsm18Ut81CADG3DU~EV3okanjv1MByeGLbVuMW~10kcTxGP3l7YUEA1QqGOW2xuYkkMhIV9xe~HzmGznsOPDOaghPwcgPqjYMwj-dnqAQaOdYzeZsHAEEebE6UkPx8IkJQPodpKS6FbZ-gSU5Aq0pcmuITMVrcI03YmgcKNb8h6Q__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
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
                    builder: ((BuildContext context) => const Signup_name()),
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
              'https://s3-alpha-sig.figma.com/img/21bf/9f96/18c24256bd689a0df35aa2e64413c1e7?Expires=1676246400&Signature=Idti2ViK15vTDvm~9OTkFyZ7Vg4ivdLaqEFT0s1wInvmchWXcImbzjpNnVxrYvTue3NdZEut3x9lR8SDG7LfbXJZE~J7-OodDoahJAe3XUQ2le7IN3oE7UlJxtZizel-nLa2uH-Dpwxu2mjMU6g2U-ia17YAgciPOSgSza4qpMTiZ4o2OT1GasbyCTIma61kEpPxH0PAqu1~HDC4BdkMYA00Na-X-1L7v0UK~fSFn6rpAhDP5e9Y1du6XIhiL8V3b~djaaF-KdNl0ma8UaAcZBnBov-BtKlvzykBuN11pppVRS-0wK~DX-92e1-QkXgivUR~e7KBJ9QAUTY3c46QEQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
          link: 'https://chest.or.kr/base.do',
        ),
        GestureDetector(
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
                    builder: ((BuildContext context) => const Signup_name()),
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
            'https://s3-alpha-sig.figma.com/img/0be0/b0e2/b67cb9c335a01b78054b2fbd871abdc7?Expires=1676246400&Signature=CMkVzxdNOohddis6UwfnNFSLsv5Hk8ToPDisnQwwOaI~1w6JagwAhbSxLSQJ64rX2~31~f8BKIkIa~IxDW1QMI4yoNgzu3HQ50GQdDiRG8jJBbBsg978IjzYb8S9zwyVrRu4CFC2QJ9H6iinT59M~oxI5m3AI8F8HzHQRQ3FYucLrOJ7w-~IE18FplZYw4IAc0kua01UQy-Pgt9I9J51kprjfJvSO6~ux-tTU9fwY6sLR3UWdce6trv0g2K-3o~HnFM9t6N0i7IkS-eaUn8LFUQAbIhWs9ISimH2p4FNo~TDnJnhnd3EKWDuviwBk-V44RIDNbatfBA4REXjLPJawA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
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
