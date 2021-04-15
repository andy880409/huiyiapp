import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String route = "/homePage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text("hello"),
      ),
      body: Center(
        child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, "/verticalPage");
            },
            child: Text("press")),
      ),
    );
  }
}
