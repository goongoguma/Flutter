import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class CartItem {
  final String id;
  final String title;
  late final int quantity;
  final double price;

  CartItem(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.price});
}

class Cart with ChangeNotifier {
  late Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemTotalCount {
    int count = 0;
    for (var key in items.keys) {
      count += items[key]!.quantity;
    }
    return count;
  }

  void addItem(String productId, String title, double price) {
    var uuid = Uuid();
    bool existProductId = _items.containsKey(productId);
    if (!existProductId) {
      _items[productId] =
          CartItem(id: uuid.v4(), title: title, price: price, quantity: 1);
    } else {
      _items.update(
          productId,
          (value) => CartItem(
              id: value.id,
              title: value.title,
              price: value.price,
              quantity: value.quantity + 1));
    }
    notifyListeners();
  }
}
