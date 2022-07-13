import 'package:flutter/material.dart';
import 'package:my_playground6/provider/products.dart';
import 'package:my_playground6/widgets/product_item.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favorite = Provider.of<Products>(context).favoriteItems;
    return Container(
      padding: EdgeInsets.all(10),
      child: GridView.builder(
          itemCount: favorite.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 1,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemBuilder: (context, index) => ChangeNotifierProvider.value(
                value: favorite[index],
                child: ProductItem(),
              )),
    );
  }
}
