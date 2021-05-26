import 'package:flutter/material.dart';

class BonusContainer extends StatelessWidget {
  final String contentText;
  final String contentItem;
  BonusContainer(this.contentText, this.contentItem);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Center(
            child: Text(
              contentText,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          padding: EdgeInsets.all(20),
          constraints: BoxConstraints(minWidth: 150, minHeight: 100),
          decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.all(Radius.circular(5))),
        ),
        Positioned(
          child: Text(
            contentItem,
            style: TextStyle(fontSize: 17),
          ),
          left: 20,
          top: 10,
        )
      ],
    );
  }
}
