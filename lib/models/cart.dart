import 'package:ecommerce_ui/models/shoe.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  //list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe('Air Jordan', '250', 'lib/images/air.jpeg',
        'Iconic style with unmatched comfort.'),
    Shoe('Air Jordan2', '350', 'lib/images/air2.webp',
        'Premium design with bold accents.'),
    Shoe('Low Dunk', '300', 'lib/images/air3.webp',
        'Low-top sneakers for casual style.'),
    Shoe('Air Jordan3', '450', 'lib/images/air.jpeg',
        'High-performance sneakers for all.'),
  ];
  // list of items in user cart
  List<Shoe> userCart = [];

  // get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  // get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  // add items to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
