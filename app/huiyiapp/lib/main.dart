import 'package:flutter/material.dart';
import 'package:huiyiapp/pages/bonus_page.dart';
import 'package:huiyiapp/providers/bonus.dart';
import 'package:huiyiapp/providers/cart.dart';
import 'package:huiyiapp/providers/mb_chart_data.dart';
import 'package:huiyiapp/pages/vertical_chart_page.dart';
import 'package:huiyiapp/pages/login_page.dart';
import 'package:huiyiapp/providers/product.dart';
import 'package:provider/provider.dart';
import 'package:huiyiapp/providers/user.dart';
import 'package:huiyiapp/pages/products_overview_page.dart';
import 'package:huiyiapp/pages/product_detail_page.dart';
import 'package:huiyiapp/pages/cart_page.dart';
import 'package:huiyiapp/pages/order_page.dart';

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
        ChangeNotifierProvider(
          create: (_) => Product(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blueAccent,
        ),
        initialRoute: LoginPage.route,
        routes: {
          ProductsOverviewPage.route: (_) => ProductsOverviewPage(),
          VerticalChartPage.route: (_) => VerticalChartPage(),
          LoginPage.route: (_) => LoginPage(),
          BonusPage.route: (_) => BonusPage(),
          ProductDetailPage.route: (_) => ProductDetailPage(),
          CartPage.route: (_) => CartPage(),
          OrderPage.route: (_) => OrderPage(),
        },
      ),
    );
  }
}
