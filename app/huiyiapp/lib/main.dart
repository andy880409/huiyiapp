import 'package:flutter/material.dart';
import 'package:huiyiapp/pages/bonus_page.dart';
import 'package:huiyiapp/providers/bonus.dart';
import 'package:huiyiapp/providers/mb_chart_data.dart';
import 'package:huiyiapp/pages/vertical_chart_page.dart';
import 'package:huiyiapp/pages/login_page.dart';
import 'package:huiyiapp/providers/product.dart';
import 'package:provider/provider.dart';
import 'package:huiyiapp/providers/user.dart';
import 'package:huiyiapp/pages/products_overview_page.dart';
import 'package:huiyiapp/pages/product_detail_page.dart';
import 'package:huiyiapp/pages/cart_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MbChartDataProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => BonusProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductProvider(),
        ),
        ChangeNotifierProvider(create: (_) => Product())
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.blue[600],
        ),
        initialRoute: LoginPage.route,
        routes: {
          ProductsOverviewPage.route: (context) => ProductsOverviewPage(),
          VerticalChartPage.route: (context) => VerticalChartPage(),
          LoginPage.route: (context) => LoginPage(),
          BonusPage.route: (context) => BonusPage(),
          ProductDetailPage.route: (context) => ProductDetailPage(),
          CartPage.route: (context) => CartPage(),
        },
      ),
    );
  }
}
