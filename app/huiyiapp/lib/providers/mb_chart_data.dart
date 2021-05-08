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
  bool isExist;
  MbChartData(
      {this.line, this.name, this.pmName, this.pmSn, this.sn, this.isExist});
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
    print(data);
    final resData = data["res_data"];
    List<MbChartData> resDataArray = [];
    for (int i = 0; i < resData.length; i++) {
      resDataArray.add(MbChartData(
        pmName: resData[i]["pm_name"],
        pmSn: resData[i]["pm_sn"],
        line: resData[i]["line"],
        sn: resData[i]["sn"],
        name: resData[i]["name"],
        isExist: true,
      ));
    }
    _datas = resDataArray;
    notifyListeners();
  }

  List<MbChartData> getChartDatas(String sn) {
    List<MbChartData> mbDataList = [];
    int counter = 0;
    int gap = 1; //第幾次的間隔 第一次+1+2,第二次+2+3,第三次+3,+4
    for (int i = 0; i < _datas.length; i++) {
      if (sn == _datas[i].sn) {
        while (mbDataList.length < 7) {
          //如果陣列中還有會員資料就加入，沒有就給空值補滿七個
          if (i + counter < _datas.length) {
            mbDataList.add(_datas[i + counter]);
            counter++;
          } else {
            mbDataList.add(MbChartData(isExist: false));
          }
        }
      }
    }
    //不能直接傳值過去，兩者會跟著變動，所以用addAll把值加過去
    List<MbChartData> newlist = [];
    newlist.addAll(mbDataList);

    for (int i = 0; i < 3; i++) {
      bool _leftNoData = true;
      bool _rightNoData = true;
      for (int h = 0; h < 7; h++) {
        print(mbDataList[h].sn);
      }
      for (int h = 0; h < 7; h++) {
        print(newlist[h].sn);
      }
      for (int j = 0; j < 7; j++) {
        if (mbDataList[i].sn == newlist[j].pmSn && newlist[j].line == "左") {
          _leftNoData = false;

          mbDataList[i + gap] = newlist[j];
          print(11111);
        }
      }
      for (int h = 0; h < 7; h++) {
        print(mbDataList[h].sn);
      }
      for (int h = 0; h < 7; h++) {
        print(newlist[h].sn);
      }
      if (_leftNoData) {
        mbDataList[i + gap] = MbChartData(isExist: false);
        //mbDataList[i + gap].isExist = false;
      }

      for (int j = 0; j < 7; j++) {
        if (mbDataList[i].sn == newlist[j].pmSn && newlist[j].line == "右") {
          _rightNoData = false;

          mbDataList[i + gap + 1] = newlist[j];
          print(456);
        }
      }

      if (_rightNoData) {
        mbDataList[i + gap + 1] = MbChartData(isExist: false);
        //mbDataList[i + gap + 1].isExist = false;
      }

      gap++;
    }
    // for (int i = 0; i < 7; i++) {
    //   print(mbDataList[i].isExist);
    // }
    // for (int i = 0; i < 7; i++) {
    //   print(mbDataList[i].sn);
    // }
    return mbDataList;
  }
}
