import 'package:flutter/material.dart';
import 'package:huiyiapp/widgets/app_drawer.dart';
import 'package:provider/provider.dart';
import 'package:huiyiapp/providers/bouns.dart';

class BonusPage extends StatelessWidget {
  static const route = "/bonusPage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: AppDrawer(),
      body: Center(
        child: TextButton(
          child: Text("pressed"),
          onPressed: () async {
            await Provider.of<BounsProvider>(context, listen: false).getBouns();
          },
        ),
      ),
    );
  }
}
