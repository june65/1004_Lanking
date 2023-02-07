import 'package:angel_lanking/model/chardata.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Graph extends StatefulWidget {
  final List<num> donationGroupList;
  const Graph({
    super.key,
    required this.donationGroupList,
  });

  @override
  State<Graph> createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  late TooltipBehavior? _tooltipBehavior;
  late SelectionBehavior _selectionBehavior;
  @override
  void initState() {
    super.initState();
    _tooltipBehavior =
        TooltipBehavior(enable: true, tooltipPosition: TooltipPosition.pointer);

    _selectionBehavior = SelectionBehavior(
      enable: true,
      toggleSelection: false,
    );
    print(widget.donationGroupList);
  }

  late List<ChartData> chartData = [
    ChartData(
      'Child',
      widget.donationGroupList[0].toDouble(),
      const Color(0xFF1ec0ff),
    ),
    ChartData(
      'Old',
      widget.donationGroupList[1].toDouble(),
      const Color(0xFF0080ff),
    ),
    ChartData(
      'World',
      widget.donationGroupList[2].toDouble(),
      const Color(0xFF03a6ff),
    ),
    ChartData(
      'Others',
      widget.donationGroupList[3].toDouble(),
      const Color(0xFFa3daff),
    ),
  ];

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
    );
  }
}
