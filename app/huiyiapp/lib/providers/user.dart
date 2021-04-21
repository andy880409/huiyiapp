import 'package:flutter/material.dart';

class UserSn {
  String sn; //
  UserSn({this.sn});
}

class User with ChangeNotifier {
  List<UserSn> _sn = [];
}
