import 'package:flutter/material.dart';
import 'package:huiyiapp/pages/vertical_chart_page.dart';
import 'package:huiyiapp/pages/login_page.dart';
import 'package:huiyiapp/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginPage().route,
      routes: {
        VerticalChartPage().route: (context) => VerticalChartPage(),
        LoginPage().route: (context) => LoginPage(),
        HomePage().route: (context) => HomePage()
      },
    );
  }
}
