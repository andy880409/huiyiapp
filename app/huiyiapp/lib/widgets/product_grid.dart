import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:huiyiapp/providers/product.dart';
import 'package:huiyiapp/widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  final _showOnlyFavorite;
  ProductGrid(this._showOnlyFavorite);
  @override
  Widget build(BuildContext context) {
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    //判斷模式是最愛還是全部
    final products = _showOnlyFavorite
        ? productProvider.favoriteItems
        : productProvider.item;
    return (products.length == 0)
        ? Center(child: Text("您目前還未喜歡任一商品喔!", style: TextStyle(fontSize: 30)))
        : GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.85),
            itemCount: products.length,
            itemBuilder: (context, index) => ChangeNotifierProvider.value(
              child: ProductItem(),
              value: products[index],
            ),
          );
  }
}
