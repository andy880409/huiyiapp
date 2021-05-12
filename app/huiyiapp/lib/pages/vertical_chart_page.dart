import 'package:flutter/material.dart';
import 'package:huiyiapp/widgets/mb_chart.dart';
import 'package:huiyiapp/providers/mb_chart_data.dart';
import 'package:huiyiapp/providers/user.dart';
import 'package:provider/provider.dart';
import 'package:huiyiapp/widgets/app_drawer.dart';

class VerticalChartPage extends StatefulWidget {
  static const route = "/verticalPage";
  @override
  _VerticalChartPageState createState() => _VerticalChartPageState();
}

class _VerticalChartPageState extends State<VerticalChartPage> {
  List<String> sn;
  bool _isInit = true;
  bool _isLoading = false;
  @override
  void didChangeDependencies() async {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      sn = Provider.of<UserProvider>(context, listen: false).getSn;
      Provider.of<MbChartDataProvider>(context)
          .fetchMbChartData(sn[0])
          .then((_) => setState(() {
                _isLoading = false;
                Provider.of<MbChartDataProvider>(context, listen: false)
                    .getChartDatas(sn[0]);
              }));
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final mbChartDatas = Provider.of<MbChartDataProvider>(context);
    var chartDatas = mbChartDatas.chartList;
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //每個MbChart有三個值,把分別的三個值傳入
                    MbChart(
                      40,
                      2.5,
                      false,
                      chartDatas[0],
                      chartDatas[1],
                      chartDatas[2],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: MbChart(
                          0,
                          2,
                          true,
                          chartDatas[1],
                          chartDatas[3],
                          chartDatas[4],
                        )),
                        Expanded(
                            child: MbChart(
                          0,
                          2,
                          true,
                          chartDatas[2],
                          chartDatas[5],
                          chartDatas[6],
                        )),
                      ],
                    ),
                  ],
                ),
              ));
  }
}
