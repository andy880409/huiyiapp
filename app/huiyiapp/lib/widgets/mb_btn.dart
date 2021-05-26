import 'package:flutter/material.dart';
import 'package:huiyiapp/providers/mb_chart_data.dart';
import 'package:huiyiapp/providers/user.dart';
import 'package:provider/provider.dart';

class MbBtn extends StatelessWidget {
  final MbChartData chartData;
  final bool isTop;
  MbBtn({this.chartData, this.isTop});
  @override
  Widget build(BuildContext context) {
    final mbChartDataProvider =
        Provider.of<MbChartDataProvider>(context, listen: false);
    final userSn = Provider.of<UserProvider>(context, listen: false).getSn;
    return GestureDetector(
      onDoubleTap: () async {
        if (isTop) {
          var upperMbSn;
          //先把上層的會員編號抓出來
          await mbChartDataProvider.fetchMbChartData(userSn[0]).then((_) =>
              upperMbSn = mbChartDataProvider.findUpperMbSn(chartData.pmSn));
          //再娶上層全部會員資料抓出來
          await mbChartDataProvider
              .fetchMbChartData(upperMbSn)
              .then((_) => mbChartDataProvider.getChartDatas(upperMbSn));
        } else {
          await mbChartDataProvider
              .fetchMbChartData(chartData.sn)
              .then((_) => mbChartDataProvider.getChartDatas(chartData.sn));
        }
      },
      child: TextButton(
        child: Text(
          chartData.name.length >= 4
              ? chartData.name.substring(0, 4) + chartData.sn
              : chartData.name + chartData.sn,
          style: TextStyle(
              fontSize: 19, fontWeight: FontWeight.bold, color: Colors.black),
          maxLines: 3,
          textAlign: TextAlign.center,
        ),
        onPressed: () {
          Provider.of<MbChartDataProvider>(context, listen: false)
              .showSingleData(chartData.sn);
        },
      ),
    );
  }
}
