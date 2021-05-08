import 'package:flutter/material.dart';
import 'package:huiyiapp/providers/mb_chart_data.dart';

class MbBtn extends StatelessWidget {
  final MbChartData chartData;
  MbBtn(this.chartData);
  final text = "台灣匯芯科技有限公司";
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        print("按兩下跑到上面");
      },
      child: TextButton(
        child: Text(
          chartData.name.length >= 4
              ? chartData.name.substring(0, 4)
              : chartData.name,
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          maxLines: 1,
          textAlign: TextAlign.center,
        ),
        onPressed: () {
          print("會員資料");
        },
      ),
    );
  }
}
