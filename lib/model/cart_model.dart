import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  
  final List _shopItems = const [
   
    ["Pepperoni", "400.00", "lib/images/pepperoni.png", Colors.green],
    ["Mixed Veg", "250.50", "lib/images/mixedveg.png", Colors.yellow],
    ["Mexican", "300.80", "lib/images/mexican.png", Colors.brown],
    ["Margherita", "200.00", "lib/images/margherita.png", Colors.blue],
  ];

  
  List _cartItems = [];

  get cartItems => _cartItems;

  get shopItems => _shopItems;

 
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
