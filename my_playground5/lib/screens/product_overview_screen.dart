import 'package:flutter/material.dart';
import '../provider/product.dart';
import '../widgets/product_item.dart';
import '../widgets/products_grid.dart';

class ProductOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('My Shop')), body: ProductsGrid());
  }
}
