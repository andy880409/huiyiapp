import 'package:flutter/material.dart';
import 'package:huiyiapp/providers/mb_chart_data.dart';

class VerticalChartContainer extends StatelessWidget {
  final MbChartData item;
  VerticalChartContainer(this.item);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      constraints: BoxConstraints(minHeight: 200, minWidth: 300),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            item.name,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Text(
            item.sn,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Text(
            "業績：",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "左：",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                "右：",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
