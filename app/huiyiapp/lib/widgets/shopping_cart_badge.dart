import 'package:flutter/material.dart';

class ShoppingCartBadge extends StatelessWidget {
  final String value;
  final Widget widget;
  ShoppingCartBadge({
    @required this.value,
    @required this.widget,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget,
        Positioned(
          top: 8,
          right: 8,
          child: Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            constraints: BoxConstraints(minHeight: 16, minWidth: 16),
            child: Text(
              value,
              style: TextStyle(fontSize: 10),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
