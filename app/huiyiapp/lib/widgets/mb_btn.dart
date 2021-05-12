import 'package:flutter/material.dart';
import 'package:huiyiapp/providers/mb_chart_data.dart';
import 'package:provider/provider.dart';

class MbBtn extends StatelessWidget {
  final MbChartData chartData;
  MbBtn(this.chartData);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () async {
        await Provider.of<MbChartDataProvider>(context, listen: false)
            .fetchMbChartData(chartData.sn)
            .then((_) =>
                Provider.of<MbChartDataProvider>(context, listen: false)
                    .getChartDatas(chartData.sn));
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
          print(chartData.name);
          print(chartData.sn);
        },
      ),
    );
  }
}
