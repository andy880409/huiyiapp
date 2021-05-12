import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Bouns {
  final String sn; //會員編號
  final String weekNo; //獎金期別
  final String orgSum; //組織總人數
  final String retailBouns; //零售獎金
  final String coachBonus; //輔導獎金
  final String fosterBouns; //培育獎金
  final String collideBouns; //對碰獎金
  final String nationwideBouns; //全國分紅
  final String globalBouns; //全球分紅
  final String celebrityBouns; //明星分紅
  final String totalBouns; //總獎金
  final String tax; //應扣稅額
  final String compTax; //發票稅額
  final String adjustmentBouns; //獎金調整
  final String nhiMoney; //二代健保
  final String shoppingPoints; //購物點數
  final String payment; //給付金額
  Bouns({
    this.sn,
    this.adjustmentBouns,
    this.celebrityBouns,
    this.coachBonus,
    this.collideBouns,
    this.compTax,
    this.fosterBouns,
    this.globalBouns,
    this.nationwideBouns,
    this.nhiMoney,
    this.orgSum,
    this.payment,
    this.retailBouns,
    this.shoppingPoints,
    this.tax,
    this.totalBouns,
    this.weekNo,
  });
}

class BounsProvider with ChangeNotifier {
  List<Bouns> _bounsDatas = [];
  List<Bouns> get bounsDatas {
    return [..._bounsDatas];
  }

  String _id;
  void storeId(String id) {
    _id = id;
    notifyListeners();
  }

  Future<void> getBouns() async {
    final url = Uri.parse("http://localhost/~andy/HUIYI/check_id.php");
    final response = await http.post(url, body: {
      "api_code": "get_bonus",
      "id_card": _id,
    });
    final data = json.decode(response.body);
    print(data);
    final resData = data["res_data"];
    List<Bouns> bounsList = [];
    for (int i = 0; i < resData.length; i++) {
      bounsList.add(Bouns(
        sn: resData[i]["sn"],
        weekNo: resData[i]["week_no"],
      ));
    }
  }
}
