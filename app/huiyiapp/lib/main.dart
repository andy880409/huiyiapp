import 'package:flutter/material.dart';
import 'package:huiyiapp/mbChart.dart';
import 'package:huiyiapp/mbBtn.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("HomePage")),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MbBtn(),
        MbChart(
          40,
          2.5,
        ),
        Row(
          children: [
            Expanded(child: MbChart(0, 2)),
            Expanded(child: MbChart(0, 2)),
          ],
        )
      ],
    );
  }
}
