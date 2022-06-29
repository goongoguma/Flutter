import 'package:flutter/material.dart';
import 'package:my_playground5/widgets/product_item.dart';
import 'package:provider/provider.dart';
import '../provider/products.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;
    return GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemBuilder: (ctx, i) => ChangeNotifierProvider(
              create: (context) => products[i],
              child: ProductItem(),
            ));
  }
}
