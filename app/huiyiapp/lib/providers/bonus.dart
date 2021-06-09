import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Bonus {
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
  Bonus({
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

class BonusProvider with ChangeNotifier {
  Map<String, Bonus> _bonusDatas = {};
  Map<String, Bonus> get bonusDatas {
    return {..._bonusDatas};
  }

  Map<String, List<String>> _bonusDatas2 = {};
  Map<String, List<String>> get bonusDatas2 {
    return {..._bonusDatas2};
  }

  List<String> _bonusItemsName = [
    "獎金期別",
    "零售獎金",
    "輔導獎金",
    "培育獎金",
    "對碰獎金",
    "全國分紅",
    "全球分紅",
    "明星分紅",
    "應扣稅額",
    "發票稅額",
    "獎金調整",
    "二代健保",
    "購物點數",
    "給付金額"
  ];
  List<String> get bonusItemsName {
    return [..._bonusItemsName];
  }

  String _id;
  void storeId(String id) {
    _id = id;
    notifyListeners();
  }

//利用身分證id獲取會員獎金資料，存取成Map用會員編號取得對應的獎金資料
  Future<void> fetchBonusData() async {
    final url = Uri.parse("http://192.168.11.7/HUIYI/check_id.php");
    final response = await http.post(url, body: {
      "api_code": "get_bonus",
      "id_card": _id,
    });
    final data = json.decode(response.body);
    print(data);
    final resData = data["res_data"];
    for (int i = 0; i < resData.length; i++) {
      _bonusDatas.putIfAbsent(
          resData[i]["sn"],
          () => Bonus(
              sn: resData[i]["sn"],
              weekNo: resData[i]["week_no"],
              orgSum: resData[i]["org_sum"],
              retailBouns: resData[i]["retail_bouns"],
              coachBonus: resData[i]["coach_bouns"],
              fosterBouns: resData[i]["foster_bouns"],
              collideBouns: resData[i]["collide_bonus"],
              nationwideBouns: resData[i]["nationwide_bonus"],
              globalBouns: resData[i]["global_bonus"],
              celebrityBouns: resData[i]["celebrity_bonus"],
              totalBouns: resData[i]["total_bonus"],
              tax: resData[i]["tax"],
              compTax: resData[i]["comp_tax"],
              adjustmentBouns: resData[i]["adjust_money"],
              nhiMoney: resData[i]["nhi_money"],
              shoppingPoints: resData[i]["shopping_points"],
              payment: resData[i]["payment"]));
      _bonusDatas2.putIfAbsent(
          resData[i]["sn"],
          () => [
                resData[i]["week_no"],
                "\$" + resData[i]["retail_bonus"],
                "\$" + resData[i]["coach_bonus"],
                "\$" + resData[i]["foster_bonus"],
                "\$" + resData[i]["collide_bonus"],
                "\$" + resData[i]["nationwide_bonus"],
                "\$" + resData[i]["global_bonus"],
                "\$" + resData[i]["celebrity_bonus"],
                "\$" + resData[i]["tax"],
                "\$" + resData[i]["comp_tax"],
                "\$" + resData[i]["adjust_money"],
                "\$" + resData[i]["nhi_money"],
                resData[i]["shopping_points"] + "點",
                "\$" + resData[i]["payment"],
              ]);
    }

    notifyListeners();
  }
}
