import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:huiyiapp/providers/cart.dart';
import 'package:huiyiapp/widgets/cart_item.dart';

class CartPage extends StatelessWidget {
  static const route = "/cartPage";
  @override
  Widget build(BuildContext context) {
    //listen為true，否則無法跟蹤物品數量的更改
    final cart = Provider.of<CartProvider>(context);
    final cartItem = cart.items;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "總金額:",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Chip(
                      label: Text(
                        "\$${cart.totalAmount}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      backgroundColor: Colors.blue[100]),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartItem.length,
              itemBuilder: (context, index) => ChangeNotifierProvider.value(
                value: cartItem.values.toList()[index],
                child: Column(
                  children: [
                    CartItem(),
                    (index != cartItem.length - 1)
                        ? Divider(
                            thickness: 1,
                          )
                        : SizedBox()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
