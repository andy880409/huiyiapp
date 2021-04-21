import 'package:flutter/material.dart';

class MbChartData {
  //單一人的資料
  final String pmSn; //安置會員編號
  final String pmName; //安置會員名稱
  final String line; //線別
  final String sn; //會員編號
  final String name; //會員名稱
  MbChartData({this.line, this.name, this.pmName, this.pmSn, this.sn});
}

class MbChartDatas with ChangeNotifier {
  //有s代表整體操作
  List<MbChartData> _datas = [];
  List<MbChartData> get datas {
    return [..._datas];
  }
}
