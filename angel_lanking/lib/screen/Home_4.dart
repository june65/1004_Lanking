import 'package:angel_lanking/api_service.dart';
import 'package:angel_lanking/model/donation.dart';
import 'package:angel_lanking/model/user.dart';
import 'package:angel_lanking/widget/Lanking.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Home_4 extends StatefulWidget {
  final String userID;
  final List donationList;
  final Future<List<DonationModel>> getDonationdata;
  const Home_4({
    super.key,
    required this.userID,
    required this.donationList,
    required this.getDonationdata,
  });

  @override
  State<Home_4> createState() => _Home_4State();
}

class _Home_4State extends State<Home_4> {
  late Future<UserModel>? usermodel;

  @override
  late TooltipBehavior? _tooltipBehavior;
  late SelectionBehavior _selectionBehavior;

  List<ChartData> chartData = [
    ChartData('Child', 12, const Color(0xFF1ec0ff)),
    ChartData('Old', 10, const Color(0xFF0080ff)),
    ChartData('World', 10, const Color(0xFF03a6ff)),
    ChartData('Others', 10, const Color(0xFFa3daff)),
    ChartData('Others', 10, const Color(0xFFa3daff)),
    ChartData('Others', 10, const Color(0xFFa3daff)),
    ChartData('Others', 10, const Color(0xFFa3daff)),
  ];
  @override
  void initState() {
    super.initState();
    _tooltipBehavior =
        TooltipBehavior(enable: true, tooltipPosition: TooltipPosition.pointer);

    _selectionBehavior = SelectionBehavior(
      enable: true,
      toggleSelection: false,
    );
    usermodel = ApiService.getUserdata(widget.userID);

    print(widget.getDonationdata);
  }

  var total = 1000;
  var cost = 800;
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
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 5,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: const [
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              '기부동향 분석',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    child: SfCircularChart(
                      tooltipBehavior: _tooltipBehavior,
                      legend: Legend(
                          isVisible: true,
                          position: LegendPosition.bottom,
                          // Overflowing legend content will be wraped
                          overflowMode: LegendItemOverflowMode.wrap),
                      series: <CircularSeries>[
                        DoughnutSeries<ChartData, String>(
                          dataSource: chartData,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y,
                          pointColorMapper: (ChartData data, _) => data.color,
                          selectionBehavior: _selectionBehavior,
                          innerRadius: '75%',
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            await launchUrlString(
                'https://1004lanking.notion.site/0efa505f492845f7843d5af203f0a5bd');
          },
          child: const my_page_button(
            text: '기부내역',
          ),
        ),
        GestureDetector(
          onTap: () async {
            await launchUrlString(
                'https://1004lanking.notion.site/0efa505f492845f7843d5af203f0a5bd');
          },
          child: const my_page_button(
            text: '회원정보',
          ),
        ),
        GestureDetector(
          onTap: () async {
            FirebaseAuth.instance.signOut();
          },
          child: const my_page_button(
            text: '로그아웃',
          ),
        ),
      ],
    );
  }
}

class my_page_button extends StatelessWidget {
  final String text;
  const my_page_button({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 5,
      ),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 1.0,
            color: const Color(0xFFCCCCCC),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      text,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.chevron_right,
                      size: 25,
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

class ChartData {
  ChartData(this.x, this.y, [this.color]);

  final String x;
  final double y;
  final Color? color;
}
