import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:huiyiapp/mbst.dart';

class LoginPage extends StatelessWidget {
  final String route = "/loginPage";
  TextEditingController user = TextEditingController();

  Future login() async {
    var url = "http://localhost/~andy/HUIYI/check_id.php";
    var response = await http.post(Uri.parse(url), body: {
      "id_card": user.text,
      "api_code": "id_inquire",
    });
    var data = json.decode(response.body) as Map<String, dynamic>;
    print(data);
    if (data["res_code"] == -1) {
      print(123);
    } else if (data["res_code"] == 0) {
      print(456);
    } else {
      List<Member> member = [];
      var mbst = data["res_data"];
      for (int i = 0; i < mbst.length; i++) {
        member.add(Member(
          name: mbst[i]["name"],
          pmId: mbst[i]["pm_id"],
          sn: mbst[i]["sn"],
        ));
        print(member[i].sn);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Image.asset('images/logo.jpeg'),
            height: 200,
          ),
          Text(
            "請輸入帳號密碼",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
              backgroundColor: Colors.blue[200],
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 90),
            child: TextField(
              controller: user,
              autofocus: true,
              decoration: InputDecoration(
                  hintText: "請輸入帳號",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 90),
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(
                  hintText: "請輸入密碼",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 40, right: 10),
                  child: TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                        hintText: "請輸入驗證碼",
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 3),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
                  ),
                ),
              ),
              Image.network("http://localhost/~andy/HUIYI/captcha.php"),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: IconButton(
                  iconSize: 30,
                  icon: Icon(
                    Icons.refresh,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 24,
          ),
          Material(
            borderRadius: BorderRadius.all(Radius.circular(13)),
            color: Colors.blue,
            child: MaterialButton(
                minWidth: 100,
                height: 42,
                child: Text(
                  "登入",
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                  ),
                ),
                onPressed: login),
          ),
        ],
      ),
    );
  }
}
