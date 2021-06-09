import 'package:flutter/material.dart';
import 'package:huiyiapp/pages/order_page.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:huiyiapp/providers/product.dart';
import 'package:huiyiapp/pages/cart_page.dart';
import 'package:provider/provider.dart';
import 'package:huiyiapp/providers/cart.dart';

class ProductDetailBottomAppBar extends StatelessWidget {
  final Product product;
  ProductDetailBottomAppBar(this.product);
  int _currentValue;
  int _surplusProduct = 100;
  //顯示底部跳出的視窗
  void _showSheet(
      BuildContext context, Color color, String text, bool directPurchase) {
    final cart = Provider.of<CartProvider>(context, listen: false);
    _currentValue = 1;
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (_, setModalState) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(children: [
                    Container(
                      width: 100,
                      height: 100,
                      child: Image.network(
                        product.imageURL,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "\$${product.price}",
                            style: TextStyle(color: Colors.red, fontSize: 25),
                          ),
                          Text(
                            "商品剩餘數量:$_surplusProduct",
                            style: TextStyle(fontSize: 17),
                          )
                        ]),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.close))
                  ]),
                  Divider(
                    thickness: 1,
                  ),
                  Row(children: [
                    Text("數量:", style: TextStyle(fontSize: 20)),
                    NumberPicker(
                      minValue: 1,
                      maxValue: _surplusProduct,
                      value: _currentValue,
                      onChanged: (value) =>
                          setModalState(() => _currentValue = value),
                    ),
                    Spacer(),
                    Text(
                      "總金額: \$${product.price * _currentValue}",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Spacer()
                  ]),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: TextButton(
                        style: TextButton.styleFrom(backgroundColor: color),
                        child: Text(
                          text,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () {
                          cart.addCartItem(
                            productId: product.id,
                            title: product.title,
                            price: product.price,
                            quantity: _currentValue,
                            imageURL: product.imageURL,
                          );
                          Navigator.of(context).pop();
                          if (directPurchase == true) {
                            Navigator.of(context).pushNamed(OrderPage.route);
                          }
                        }),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () => _showSheet(context, Colors.blue, "加入購物車", false),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 1),
                    child: Icon(Icons.shopping_cart),
                  ),
                  Text("加入購物車"),
                ],
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () => _showSheet(context, Colors.red, "直接購買", true),
              child: Text(
                "直接購買",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
