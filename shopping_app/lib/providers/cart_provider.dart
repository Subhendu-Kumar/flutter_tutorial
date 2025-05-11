import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> cartItem = [];

  void addToCart(Map<String, dynamic> item) {
    cartItem.add(item);
    notifyListeners();
  }

  void removeFromCart(Map<String, dynamic> item) {
    cartItem.remove(item);
    notifyListeners();
  }
}
