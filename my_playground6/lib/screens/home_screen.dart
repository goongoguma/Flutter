import 'package:flutter/material.dart';
import 'package:my_playground6/provider/products.dart';
import 'package:provider/provider.dart';
import '../widgets/product_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Main Page'),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: GridView.builder(
          itemCount: products.productCount,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemBuilder: (context, index) => ChangeNotifierProvider.value(
            value: products.items[index],
            child: ProductItem(),
          ),
        ));
  }
}
