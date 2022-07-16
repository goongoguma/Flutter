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

  int get itemCount {
    return _items.length;
  }

  void addItem(String productId, String title, double price) {
    var uuid = Uuid();
    // 여기서부터.. (아이템 추가가 안됨)
    bool existProductId = _items.containsKey(productId);
    if (!existProductId) {
      _items["prodcutId"] =
          CartItem(id: uuid.v4(), title: title, price: price, quantity: 1);
    } else {
      _items["productId"]!.quantity = _items["productId"]!.quantity + 1;
    }
  }
}
