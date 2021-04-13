import 'package:flutter/material.dart';
import 'package:huiyiapp/linePainter.dart';
import 'package:huiyiapp/mbBtn.dart';

class MbChart extends StatelessWidget {
  final double length;
  final double thick;
  MbChart(this.length, this.thick);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270 + length,
      height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CustomPaint(
              size: Size(130 + length, 50),
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
