import 'package:angel_lanking/api_service.dart';
import 'package:angel_lanking/model/chardata.dart';
import 'package:angel_lanking/model/groupuser.dart';
import 'package:angel_lanking/screen/Home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Donation_detail extends StatefulWidget {
  final String userID;
  final int money;
  final int used_money;
  final String user_group;
  final List donationList;
  const Donation_detail({
    super.key,
    required this.userID,
    required this.money,
    required this.used_money,
    required this.user_group,
    required this.donationList,
  });

  @override
  State<Donation_detail> createState() => _Donation_detailState();
}

class _Donation_detailState extends State<Donation_detail> {
  String group = '';

  late TooltipBehavior? _tooltipBehavior;

  late SelectionBehavior _selectionBehavior;

  double _currentSliderValue = 0;

  late String user_id;
  late Future<GroupUserModel>? groupusermodel;
  @override
  void initState() {
    super.initState();
    _tooltipBehavior =
        TooltipBehavior(enable: true, tooltipPosition: TooltipPosition.pointer);

    _selectionBehavior = SelectionBehavior(
      enable: true,
      toggleSelection: false,
    );
    groupusermodel = ApiService.getGroupUser(widget.user_group);
  }

  late List<ChartData> chartData = [
    ChartData(
      '사회복지',
      900,
      const Color(0xFF5E3FBE),
    ),
    ChartData(
      '해외 구호활동',
      200,
      const Color(0xFF886BD8),
    ),
    ChartData(
      '지역사회 발전',
      100,
      const Color(0xFFA88DEB),
    ),
    ChartData(
      '교육 및 연구활동',
      100,
      const Color(0xFFCBB6F8),
    ),
    ChartData(
      '기타',
      100,
      const Color(0xFFE5DAFB),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((BuildContext context) => Home(
                                          page: 3,
                                          search_group: 1,
                                          userID: widget.userID,
                                          donationList: widget.donationList,
                                          my_group: 0,
                                          user_group: widget.user_group,
                                        )),
                                    fullscreenDialog: true,
                                  ),
                                );
                              },
                              child: const Icon(
                                Icons.close,
                                color: Color(0xFF666666),
                                size: 30,
                              ),
                            ),
                            Image.network(
                              'https://dogmbti.s3.ap-northeast-2.amazonaws.com/1004_lanking/main_logo.png',
                              width: 120,
                              height: 60,
                              fit: BoxFit.fitWidth,
                            ),
                            const Icon(
                              Icons.notifications_none_outlined,
                              color: Color(0xFF666666),
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                      Image.network(
                        'https://dogmbti.s3.ap-northeast-2.amazonaws.com/1004_lanking/81c17e6cea651082dc6394a21c87b069.png',
                        fit: BoxFit.fitWidth,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '천사발굴단',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              '(100,000/1,000,000)',
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFFAEAEAE),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                              ),
                              child: Container(
                                height: 15,
                                width: double.infinity,
                                color: const Color(0xFFC8C8C8),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: (100000),
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
                                      flex: (1000000 - 100000),
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
                                  '총 기부금 : 100,000원',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF464646),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 0,
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
                                            '기부 비율',
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
                                        overflowMode:
                                            LegendItemOverflowMode.wrap),
                                    series: <CircularSeries>[
                                      DoughnutSeries<ChartData, String>(
                                        dataSource: chartData,
                                        xValueMapper: (ChartData data, _) =>
                                            data.x,
                                        yValueMapper: (ChartData data, _) =>
                                            data.y,
                                        pointColorMapper: (ChartData data, _) =>
                                            data.color,
                                        selectionBehavior: _selectionBehavior,
                                        innerRadius: '0%',
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 120,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 193, 230, 255),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                  ),
                  child: Slider(
                    thumbColor: Colors.white,
                    activeColor: Colors.blue,
                    value: _currentSliderValue,
                    max: widget.money.toDouble(),
                    divisions: 100,
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value;
                      });
                    },
                  ),
                ),
                FutureBuilder(
                    future: groupusermodel,
                    builder: (context, snapshot) {
                      return snapshot.hasData
                          ? GestureDetector(
                              onTap: () async {
                                await FirebaseFirestore.instance
                                    .collection('user')
                                    .doc(widget.userID)
                                    .update({
                                  'money': widget.money -
                                      _currentSliderValue.toInt(),
                                  'used_money': widget.used_money +
                                      _currentSliderValue.toInt(),
                                });
                                await FirebaseFirestore.instance
                                    .collection('group')
                                    .doc(widget.user_group)
                                    .update({
                                  'money': snapshot.data!.money +
                                      _currentSliderValue.toInt(),
                                });
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((BuildContext context) => Home(
                                          page: 3,
                                          search_group: 1,
                                          userID: widget.userID,
                                          donationList: widget.donationList,
                                          my_group: 0,
                                          user_group: widget.user_group,
                                        )),
                                    fullscreenDialog: true,
                                  ),
                                );
                              },
                              child: Container(
                                height: 60,
                                alignment: Alignment.center,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        const SizedBox(
                                          height: 11,
                                        ),
                                        Image.network(
                                          'https://dogmbti.s3.ap-northeast-2.amazonaws.com/1004_lanking/%EC%B2%9C%EC%82%AC%EB%9E%AD%ED%82%B9-%EB%A1%9C%EA%B3%A0-003+(1).png',
                                          width: 40,
                                          height: 40,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15),
                                      child: Text(
                                          '${ApiService.money_f.format(_currentSliderValue.toInt())}원 기부하기',
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container();
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
