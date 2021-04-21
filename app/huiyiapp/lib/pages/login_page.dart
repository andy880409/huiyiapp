import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:huiyiapp/providers/mb_chart_data.dart';
import 'dart:convert';
import 'package:huiyiapp/providers/user.dart';
import 'package:huiyiapp/pages/vertical_chart_page.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  final String route = "/loginPage";
  TextEditingController userText = TextEditingController();
  void dispose() {
    userText.dispose();
  }

  Future login(BuildContext context) async {
    var url = Uri.parse("http://localhost/~andy/HUIYI/check_id.php");
    var response = await http.post(url, body: {
      //身份驗證
      "id_card": userText.text,
      "api_code": "id_inquire",
    });
    var data = json.decode(response.body) as Map<String, dynamic>;
    //print(data);
    if (data["res_code"] == -1) {
      print(123);
    } else if (data["res_code"] == 0) {
      print(456);
    } else {
      var resData = data["res_data"];
      Provider.of<User>(context, listen: false).addSn(resData); //把會員編號統整成陣列
      List<UserSn> user =
          Provider.of<User>(context, listen: false).sn; //回傳會員編號陣列
      response = await http.post(url, body: {
        //取得立式組織圖
        "sn": user[0].sn,
        "api_code": "member_list",
      });
      data = json.decode(response.body);
      List<MbChartData> mbChartData = [];
      resData = data["res_data"];
      for (int i = 0; i < resData.length; i++) {
        //把安置圖的資料轉成陣列
        mbChartData.add(MbChartData(
          name: resData[i]["name"],
          pmSn: resData[i]["pm_sn"],
          sn: resData[i]["sn"],
          line: resData[i]["line"],
          pmName: resData[i]["pm_name"],
        ));
      }
      print(data);
      Navigator.of(context).pushNamed(
        VerticalChartPage().route,
        arguments: {
          "allUserData": user,
          "mbChartData": mbChartData,
          "topSn": user[0].sn
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
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
                  controller: userText,
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
                        decoration: InputDecoration(
                            hintText: "請輸入驗證碼",
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 3),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20)),
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
                    onPressed: () {
                      login(context);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
