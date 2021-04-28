import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

  Future<void> fetchMbChartData(String sn) async {
    final url = Uri.parse("http://localhost/~andy/HUIYI/check_id.php");
    final response = await http.post(url, body: {
      "sn": sn,
      "api_code": "member_list",
    });
    final data = json.decode(response.body) as Map<String, dynamic>;
    final resData = data["res_data"];
    var resDataArray = [];
    for (int i = 0; i < resData.length; i++) {
      resDataArray.add(MbChartData(
        pmName: resData[i]["pm_name"],
        pmSn: resData[i]["pm_sn"],
        line: resData[i]["line"],
        sn: resData[i]["sn"],
        name: resData[i]["name"],
      ));
    }
    _datas = resDataArray;
  }
}
