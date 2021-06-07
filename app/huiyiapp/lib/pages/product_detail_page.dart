import 'package:flutter/material.dart';
import 'package:huiyiapp/widgets/product_detail_bottom_appBar.dart';
import 'package:huiyiapp/providers/product.dart';
import 'package:huiyiapp/pages/cart_page.dart';

class ProductDetailPage extends StatefulWidget {
  static const route = "/productDetailPage";

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int _currentValue = 1;
  int _surplusProduct = 100;
  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context).settings.arguments as Product;
    // final product = Provider.of<ProductProvider>(context, listen: false)
    //     .findById(productId);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0.5,
            actions: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartPage.route);
                },
              )
            ],
          ),
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.only(left: 10),
                  ),
                  Padding(
                    child: Row(
                      children: [
                        Text(
                          "\$" + product.price.toString(),
                          style: TextStyle(color: Colors.red, fontSize: 20),
                        ),
                        Spacer(),
                        Text(
                          "已售出:999",
                          style: TextStyle(fontSize: 18),
                        ),
                        IconButton(
                          icon: Icon(
                            product.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: product.isFavorite
                                ? Colors.red
                                : Colors.black26,
                          ),
                          onPressed: () {
                            setState(() {});
                            product.toggleFavoriteState();
                          },
                        ),
                      ],
                    ),
                    padding: EdgeInsets.only(left: 10),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Padding(
                    child: Text(
                      "商品介紹:",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    padding: EdgeInsets.only(left: 10),
                  ),
                  Padding(
                    child: Text(
                      product.description,
                    ),
                    padding: EdgeInsets.only(left: 10),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: ProductDetailBottomAppBar(product)),
    );
  }
}
