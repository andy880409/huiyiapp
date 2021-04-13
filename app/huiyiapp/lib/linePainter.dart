import 'package:flutter/material.dart';

class LinePainter extends CustomPainter {
  final double thick;
  LinePainter({this.thick});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = thick
      ..color = Colors.red;
    canvas.drawLine(
      //橫
      Offset(0, size.height / 2),
      Offset(size.width, size.height / 2),
      paint,
    );
    canvas.drawLine(
      //上
      Offset(size.width / 2, size.height / 4),
      Offset(size.width / 2, size.height / 2),
      paint,
    );
    canvas.drawLine(
      //左
      Offset(0, size.height / 2),
      Offset(0, size.height * 3 / 4),
      paint,
    );
    canvas.drawLine(
      //右
      Offset(size.width, size.height / 2),
      Offset(size.width, size.height * 3 / 4),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
