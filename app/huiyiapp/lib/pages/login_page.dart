import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:huiyiapp/providers/bonus.dart';
import 'dart:convert';
import 'package:huiyiapp/providers/user.dart';
import 'package:huiyiapp/pages/vertical_chart_page.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  static const route = "/loginPage";
  final TextEditingController userText = TextEditingController();
  void dispose() {
    userText.dispose();
  }

  Future<void> login(BuildContext context) async {
    final url = Uri.parse("http://192.168.11.12/HUIYI/check_id.php");
    final response = await http.post(url, body: {
      //身份驗證
      "id_card": userText.text,
      "api_code": "id_inquire",
    });
    final data = json.decode(response.body) as Map<String, dynamic>;
    //print(data);
    if (data["res_code"] == -1) {
      print(123);
    } else if (data["res_code"] == 0) {
      print(456);
    } else {
      Provider.of<UserProvider>(context, listen: false)
          .addSn(data["res_data"], userText.text); //把會員編號統整成陣列
      Provider.of<BonusProvider>(context, listen: false).storeId(userText.text);
      Navigator.of(context).pushNamed(
        VerticalChartPage.route,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
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
                            borderSide:
                                BorderSide(color: Colors.black, width: 3),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
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
                            borderSide:
                                BorderSide(color: Colors.black, width: 3),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
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
                    Image.network("http://192.168.11.12/HUIYI/captcha.php"),
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
      ),
    );
  }
}
