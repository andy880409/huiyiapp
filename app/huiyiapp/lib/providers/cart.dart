import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  final String id;
  final String title;
  final int quantity;
  final int price;
  final String imageURL;
  Cart({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
    @required this.imageURL,
  });
}

class CartProvider with ChangeNotifier {
  Map<String, Cart> _items = {};
  Map<String, Cart> get items {
    return {..._items};
  }

  int get totalAmount {
    int total = 0;
    _items.forEach((productId, cart) {
      total += cart.price * cart.quantity;
    });
    return total;
  }

  int get itemAmount {
    return _items.length;
  }

  void addCartItem(
      {@required String productId,
      @required String title,
      @required int price,
      @required int quantity,
      @required String imageURL}) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingCartItem) => Cart(
            id: existingCartItem.id,
            title: existingCartItem.title,
            price: existingCartItem.price,
            quantity: existingCartItem.quantity + quantity,
            imageURL: existingCartItem.imageURL),
      );
    } else {
      //map中absent(缺席)就加進去
      _items.putIfAbsent(
          productId,
          () => Cart(
                id: productId,
                title: title,
                price: price,
                quantity: quantity,
                imageURL: imageURL,
              ));
    }
    notifyListeners();
  }

  void removeItems(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (_items[productId].quantity > 1) {
      _items.update(
        productId,
        (existingCartItem) => Cart(
            id: existingCartItem.id,
            title: existingCartItem.title,
            price: existingCartItem.price,
            imageURL: existingCartItem.imageURL,
            quantity: existingCartItem.quantity - 1),
      );
    } else {
      removeItems(productId);
    }
    notifyListeners();
  }
}
