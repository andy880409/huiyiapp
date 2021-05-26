import 'package:flutter/material.dart';
import 'package:huiyiapp/pages/bonus_page.dart';
import 'package:huiyiapp/providers/bonus.dart';
import 'package:huiyiapp/providers/mb_chart_data.dart';
import 'package:huiyiapp/pages/vertical_chart_page.dart';
import 'package:huiyiapp/pages/login_page.dart';
import 'package:provider/provider.dart';
import 'package:huiyiapp/providers/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: MbChartDataProvider(),
        ),
        ChangeNotifierProvider.value(
          value: UserProvider(),
        ),
        ChangeNotifierProvider.value(
          value: BonusProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(primaryColor: Colors.blue[300]),
        initialRoute: LoginPage.route,
        routes: {
          VerticalChartPage.route: (context) => VerticalChartPage(),
          LoginPage.route: (context) => LoginPage(),
          BonusPage.route: (context) => BonusPage(),
        },
      ),
    );
  }
}
