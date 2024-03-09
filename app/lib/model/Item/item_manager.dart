import 'package:app/model/Item/item.dart';
import 'package:flutter/material.dart';

class ItemManager extends ChangeNotifier {
  List<Item> featuredItems = [
    Item(
      name: 'Nike Shoes',
      brand: 'Nike',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      imagePath: 'assets/im1.jpg',
      price: 430,
      rating: 4.5,
      review: 20,
      isFavoraite: false,
      sizes: [8,10,38,40]
    ),

  ];
  
  List<Item> popularItems = [
    Item(
      name: 'Nike Shoes',
      brand: 'Nike',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      imagePath: 'assets/im1.jpg',
      price: 430,
      rating: 4.5,
      review: 20,
      isFavoraite: false,
      sizes: [8,10,38,40]
    ),
  ];

// To mark/unmark favoraite items
  void manageFavoraite(Item item) {
    item.isFavoraite = !item.isFavoraite;
    notifyListeners();
  }
}
