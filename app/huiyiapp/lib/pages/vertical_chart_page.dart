import 'package:flutter/material.dart';
import 'package:huiyiapp/mb_chart.dart';
import 'package:huiyiapp/mb_btn.dart';

class VerticalChartPage extends StatelessWidget {
  final String route = "/verticalPage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MbBtn(),
        MbChart(40, 2.5),
        Row(
          children: [
            Expanded(child: MbChart(0, 2)),
            Expanded(child: MbChart(0, 2)),
          ],
        )
      ],
    ));
  }
}
