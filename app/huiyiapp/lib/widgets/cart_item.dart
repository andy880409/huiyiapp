import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:huiyiapp/providers/cart.dart';

class CartItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        leading: Container(
          constraints: BoxConstraints(
            maxWidth: 80,
            maxHeight: 80,
            minWidth: 80,
            minHeight: 80,
          ),
          child: Image.network(
            cart.imageURL,
            fit: BoxFit.contain,
          ),
        ),
        title: Text(
          cart.title,
          style: TextStyle(fontSize: 17),
        ),
        subtitle: Text("\$${cart.price}"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                cartProvider.removeSingleItem(cart.id);
              },
              icon: Icon(Icons.remove),
            ),
            Text("${cart.quantity}"),
            IconButton(
              onPressed: () {
                cartProvider.addCartItem(
                    productId: cart.id,
                    title: cart.title,
                    price: cart.price,
                    imageURL: cart.imageURL,
                    quantity: 1);
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
