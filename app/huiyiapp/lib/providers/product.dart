import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final int price;
  final String imageURL;
  bool isFavorite;
  Product({
    this.id,
    this.title,
    this.description,
    this.price,
    this.imageURL,
    this.isFavorite = false,
  });
  void toggleFavoriteState() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}

class ProductProvider with ChangeNotifier {
  bool _showOnlyFavorite = false;
  List<Product> _items = [
    Product(
        id: "1",
        title: "書",
        description: "這是一本書",
        price: 33,
        imageURL:
            "https://www.auliving.com.au/wp-content/uploads/2019/12/book-png-book-stack-png-image-25686-1024-640x640.png"),
    Product(
        id: "2",
        title: "筆",
        description: "這是一支筆",
        price: 44,
        imageURL:
            "https://e.ecimg.tw/items/DSACPJA9007P9IL/i010001_1480745355.jpg"),
    Product(
        id: "3",
        title: "杯子",
        description: "這是一個杯子",
        price: 199,
        imageURL:
            "https://www.searchome.net/article/blogAlbum/60/1/4d58f13a472b0.jpg"),
    Product(
        id: "4",
        title: "衣服",
        description: "這是一件衣服",
        price: 2999,
        imageURL:
            "https://imgprd19.hobbylobby.com/9/5f/26/95f264323ae49e65b2a53a909fcd7d9ee659f3c7/350Wx350H-422519-0320.jpg"),
  ];
  List<Product> get item {
    return [..._items];
  }

  bool get favOrAllState {
    return _showOnlyFavorite;
  }

  Product findById(String id) {
    return _items.firstWhere((product) => product.id == id);
  }

  void showAllOrOnlyFav(bool favState) {
    _showOnlyFavorite = favState;
    notifyListeners();
  }

  void toggleFavoriteState(String id) {
    Product product = _items.firstWhere((products) => products.id == id);
    product.isFavorite = !product.isFavorite;
    notifyListeners();
  }

  List<Product> get favoriteItems {
    //where內的條件是true就回傳符合的條件
    return _items.where((product) => product.isFavorite).toList();
  }

  void addProductItem() {
    notifyListeners();
  }
}
