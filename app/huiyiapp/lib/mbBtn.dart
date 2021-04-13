import 'package:flutter/material.dart';

class MbBtn extends StatelessWidget {
  final text = "依帕爾古";
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        print("按兩下跑到上面");
      },
      child: TextButton(
        child: Text(
          text.length >= 4 ? text.substring(0, 4) : text,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
