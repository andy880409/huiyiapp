import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:huiyiapp/providers/product.dart';

class ProductDetailBottomAppBar extends StatefulWidget {
  final Product product;
  ProductDetailBottomAppBar(this.product);
  @override
  _ProductDetailBottomAppBarState createState() =>
      _ProductDetailBottomAppBarState();
}

class _ProductDetailBottomAppBarState extends State<ProductDetailBottomAppBar> {
  int _currentValue = 1;
  int _surplusProduct = 100;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                showBottomSheet(
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(builder: (_, setModalState) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(children: [
                              Container(
                                width: 100,
                                height: 100,
                                child: Image.network(
                                  widget.product.imageURL,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Column(children: [
                                Text(
                                  "\$" + widget.product.price.toString(),
                                  style: TextStyle(color: Colors.red),
                                ),
                                Text("商品剩餘數量:$_surplusProduct")
                              ])
                            ]),
                            Row(children: [
                              Text("數量"),
                              NumberPicker(
                                  minValue: 1,
                                  maxValue: _surplusProduct,
                                  value: _currentValue,
                                  onChanged: (value) => setModalState(
                                      () => _currentValue = value))
                            ]),
                            TextButton(child: Text("加入購物車"), onPressed: () {}),
                          ],
                        );
                      });
                    });
              },
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
              onPressed: () {},
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
