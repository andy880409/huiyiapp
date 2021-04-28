import 'package:flutter/material.dart';

class UserSn {
  String sn; //
  UserSn({this.sn});
}

class User with ChangeNotifier {
  List<UserSn> _sn = [];
  List<UserSn> get getSn {
    return [..._sn];
  }

  void addSn(dynamic resData) {
    List<UserSn> user = [];
    for (int i = 0; i < resData.length; i++) {
      //把登入會員的資料轉成陣列
      user.add(UserSn(
        sn: resData[i]["sn"],
      ));
      print(user[i].sn);
    }
    _sn = user;

    notifyListeners();
  }
}
