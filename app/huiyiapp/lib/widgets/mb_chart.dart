import 'package:flutter/material.dart';
import 'package:huiyiapp/linePainter.dart';
import 'package:huiyiapp/widgets/mb_btn.dart';

class MbChart extends StatelessWidget {
  final double length;
  final double thick;
  final bool _isSecond;
  MbChart(this.length, this.thick, this._isSecond);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270 + length,
      height: 130 + length,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _isSecond ? SizedBox() : MbBtn(),
          Expanded(
            child: CustomPaint(
              size: Size(140 + length, 70),
              painter: LinePainter(thick: thick),
            ),
          ),
          Row(
            children: [
              Expanded(child: MbBtn()),
              Expanded(child: MbBtn()),
            ],
          )
        ],
      ),
    );
  }
}
