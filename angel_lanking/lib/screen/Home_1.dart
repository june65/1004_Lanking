import 'package:angel_lanking/api_service.dart';
import 'package:angel_lanking/model/donation.dart';
import 'package:angel_lanking/model/user.dart';
import 'package:angel_lanking/screen/Home.dart';
import 'package:angel_lanking/widget/Banner.dart';
import 'package:angel_lanking/widget/Lanking.dart';
import 'package:angel_lanking/widget/Website.dart';
import 'package:flutter/material.dart';

class Home_1 extends StatefulWidget {
  final String userID;
  final List donationList;
  const Home_1({
    super.key,
    required this.userID,
    required this.donationList,
  });

  @override
  State<Home_1> createState() => _Home_1State();
}

class _Home_1State extends State<Home_1> {
  late Future<UserModel>? usermodel;

  late Future<List<DonationModel>> getDonationdata;

  var total = 1000;
  var cost = 800;

  @override
  void initState() {
    super.initState();
    usermodel = ApiService.getUserdata(widget.userID);

    getDonationdata = ApiService.getDonationdata(widget.donationList);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
            future: usermodel,
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return Lanking(
                    name: snapshot.data!.name,
                    group: snapshot.data!.group,
                    lank: '실버 III 80%',
                    point: 0,
                    cost: cost,
                    total: total);
              }
              return Lanking(
                  name: '...',
                  group: '...',
                  lank: '...',
                  point: 0,
                  cost: cost,
                  total: total);
            })),
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
            FutureBuilder(
              future: getDonationdata,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((BuildContext context) => Home(
                                page: 2,
                                group: 3,
                                userID: widget.userID,
                                donationList: widget.donationList,
                              )),
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
                  );
                }
                return Container();
              },
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
            FutureBuilder(
              future: getDonationdata,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((BuildContext context) => Home(
                                page: 2,
                                group: 1,
                                userID: widget.userID,
                                donationList: widget.donationList,
                              )),
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
                  );
                }
                return Container();
              },
            )
          ],
        ),
        const Banners(
          image:
              'https://s3-alpha-sig.figma.com/img/21bf/9f96/18c24256bd689a0df35aa2e64413c1e7?Expires=1676246400&Signature=Idti2ViK15vTDvm~9OTkFyZ7Vg4ivdLaqEFT0s1wInvmchWXcImbzjpNnVxrYvTue3NdZEut3x9lR8SDG7LfbXJZE~J7-OodDoahJAe3XUQ2le7IN3oE7UlJxtZizel-nLa2uH-Dpwxu2mjMU6g2U-ia17YAgciPOSgSza4qpMTiZ4o2OT1GasbyCTIma61kEpPxH0PAqu1~HDC4BdkMYA00Na-X-1L7v0UK~fSFn6rpAhDP5e9Y1du6XIhiL8V3b~djaaF-KdNl0ma8UaAcZBnBov-BtKlvzykBuN11pppVRS-0wK~DX-92e1-QkXgivUR~e7KBJ9QAUTY3c46QEQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
          link: 'https://chest.or.kr/base.do',
        ),
        const Website(),
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
