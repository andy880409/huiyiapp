import 'package:flutter/material.dart';
import 'package:huiyiapp/widgets/linePainter.dart';
import 'package:huiyiapp/providers/mb_chart_data.dart';
import 'package:huiyiapp/widgets/mb_btn.dart';

class MbChart extends StatelessWidget {
  final double length;
  final double thick;
  final bool _isSecond;
  final MbChartData top;
  final MbChartData left;
  final MbChartData right;
  final Image welcomeGIF = Image.asset(
    "images/welcome.GIF",
    height: 70,
  );
  MbChart(
      this.length, this.thick, this._isSecond, this.top, this.left, this.right);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270 + length,
      height: 130 + length,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //下面兩個表沒有上的資料（防止資歷重疊），如果沒有資料就用gif檔
          _isSecond ? SizedBox() : MbBtn(chartData: top, isTop: true),
          Expanded(
              child: top.isExist
                  ? CustomPaint(
                      size: Size(140 + length, 70),
                      painter: LinePainter(
                        thick: thick,
                      ),
                    )
                  : SizedBox()),
          Row(
            children: [
              //如果沒有資料就用gif檔
              Expanded(
                  child: left.isExist
                      ? MbBtn(
                          chartData: left,
                          isTop: false,
                        )
                      : (top.isExist ? welcomeGIF : SizedBox())),
              Expanded(
                  child: right.isExist
                      ? MbBtn(
                          chartData: right,
                          isTop: false,
                        )
                      : (top.isExist ? welcomeGIF : SizedBox())),
            ],
          )
        ],
      ),
    );
  }
}
