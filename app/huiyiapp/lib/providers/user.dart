import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  List<String> _sn = [];
  List<String> get getSn {
    return [..._sn];
  }

  void addSn(dynamic resData, String id) {
    List<String> user = [];
    for (int i = 0; i < resData.length; i++) {
      //把登入會員的資料轉成陣列
      user.add(
        resData[i]["sn"],
      );
      print(user[i]);
    }
    _sn = user;

    notifyListeners();
  }
}
