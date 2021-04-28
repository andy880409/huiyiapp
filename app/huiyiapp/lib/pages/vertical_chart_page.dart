import 'package:flutter/material.dart';
import 'package:huiyiapp/widgets/mb_chart.dart';
import 'package:huiyiapp/widgets/mb_btn.dart';
import 'package:huiyiapp/providers/mb_chart_data.dart';
import 'package:huiyiapp/providers/user.dart';

class VerticalChartPage extends StatelessWidget {
  final String route = "/verticalPage";
  bool isMidNoData = false;
  bool isBottomNoData = false;
  @override
  Widget build(BuildContext context) {
    var sendBackTopSn;
    return Scaffold(
        drawer: Drawer(),
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MbChart(40, 2.5, false),
            Row(
              children: [
                Expanded(child: MbChart(0, 2, true)),
                Expanded(child: MbChart(0, 2, true)),
              ],
            ),
          ],
        ));
  }
}
