import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final String route = "/loginPage";
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
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: IconButton(
                    iconSize: 35,
                    icon: Icon(
                      Icons.refresh,
                    )),
              )
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
                Navigator.of(context).pushNamed("/homePage");
              },
            ),
          ),
        ],
      ),
    );
  }
}
