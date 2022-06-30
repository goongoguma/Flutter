import 'package:flutter/material.dart';
import 'package:flutter_project_shopping/provider/products.dart';
import 'package:flutter_project_shopping/widgets/product_item.dart';
import 'package:provider/provider.dart';
import '../provider/products.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavorites;

  ProductsGrid(this.showFavorites);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products =
        showFavorites ? productsData.favoriteItems : productsData.items;
    return GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: products.length,
        // 리스트 렌더링에 있어서 ChangeNotifierProvider.value 사용을 권장
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
              value: products[i],
              child: ProductItem(),
            ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10));
  }
}
