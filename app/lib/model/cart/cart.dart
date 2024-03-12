import 'package:app/model/Item/item.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  late List<Item> cartItems = [];

  void addItemToCart(Item item) {
    cartItems.add(item);
    notifyListeners();
  }

  void removeItemFromCart(Item item) {
    cartItems.remove(item);
    notifyListeners();
  }
}
