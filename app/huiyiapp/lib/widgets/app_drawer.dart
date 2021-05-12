import 'package:flutter/material.dart';
import 'package:huiyiapp/pages/bonus_page.dart';
import 'package:huiyiapp/pages/vertical_chart_page.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Hello Friend!'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.bar_chart,
              size: 30,
            ),
            title: Text(
              '立式組織圖',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                VerticalChartPage.route,
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.attach_money,
              size: 30,
            ),
            title: Text(
              '獎金查詢',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                BonusPage.route,
              );
            },
          ),
        ],
      ),
    );
  }
}
