import 'package:flutter/material.dart';
import 'package:huiyiapp/widgets/app_drawer.dart';
import 'package:huiyiapp/widgets/product_grid.dart';
import 'package:huiyiapp/pages/cart_page.dart';

enum FilterOption {
  All,
  Favorite,
}

class ProductsOverviewPage extends StatefulWidget {
  static const route = "/productsOverviewPage";

  @override
  _ProductsOverviewPageState createState() => _ProductsOverviewPageState();
}

class _ProductsOverviewPageState extends State<ProductsOverviewPage> {
  bool _showOnlyFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        actions: [
          PopupMenuButton(
              onSelected: (FilterOption selectValue) {
                setState(() {
                  if (selectValue == FilterOption.Favorite) {
                    _showOnlyFavorite = true;
                  } else {
                    _showOnlyFavorite = false;
                  }
                });
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text("顯示全部"),
                      value: FilterOption.All,
                    ),
                    PopupMenuItem(
                      child: Text("我的最愛"),
                      value: FilterOption.Favorite,
                    )
                  ]),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).pushNamed(CartPage.route);
            },
          )
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
          padding: EdgeInsets.all(15), child: ProductGrid(_showOnlyFavorite)),
    );
  }
}
