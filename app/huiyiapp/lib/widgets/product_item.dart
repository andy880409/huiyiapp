import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:huiyiapp/providers/product.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:huiyiapp/pages/product_detail_page.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(ProductDetailPage.route, arguments: product);
                },
                child: FadeInImage.memoryNetwork(
                  fit: BoxFit.contain,
                  image: product.imageURL,
                  placeholder: kTransparentImage,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 3, left: 5),
              child: Column(
                children: [
                  Text(
                    product.title,
                    style: TextStyle(fontSize: 18),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$" + product.price.toString(),
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Consumer<Product>(
                        builder: (context, product, _) => IconButton(
                          icon: Icon(
                            product.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: product.isFavorite
                                ? Colors.red
                                : Colors.black26,
                          ),
                          onPressed: () {
                            product.toggleFavoriteState();
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
