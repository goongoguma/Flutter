import 'package:flutter/material.dart';
import 'package:my_playground6/provider/product.dart';

class ProductItem extends StatelessWidget {
  final Product item;

  ProductItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(item.title),
    );
  }
}
