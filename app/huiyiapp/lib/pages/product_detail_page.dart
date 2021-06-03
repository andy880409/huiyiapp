import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:huiyiapp/providers/product.dart';

class ProductDetailPage extends StatelessWidget {
  static const route = "/productDetailPage";
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final product = Provider.of<ProductProvider>(context, listen: false)
        .findById(productId);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.network(
                    product.imageURL,
                    height: 300,
                    fit: BoxFit.contain,
                  ),
                ),
                Divider(
                  thickness: 1,
                ),
                Padding(
                  child: Text(
                    product.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  padding: EdgeInsets.only(left: 10),
                ),
                Padding(
                  child: Text(
                    "\$" + product.price.toString(),
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                  padding: EdgeInsets.only(left: 10),
                ),
                Divider(
                  thickness: 1,
                ),
                Padding(
                  child: Text("商品介紹:"),
                  padding: EdgeInsets.only(left: 10),
                ),
                Padding(
                  child: Text(product.description),
                  padding: EdgeInsets.only(left: 10),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () {},
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
        ),
      ),
    );
  }
}
