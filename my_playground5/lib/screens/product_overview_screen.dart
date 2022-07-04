import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/product.dart';
import '../provider/products.dart';
import '../widgets/product_item.dart';
import '../widgets/products_grid.dart';
import '../provider/cart.dart';
import '../widgets/badge.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    final productsContainer = Provider.of<Products>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: Text('My Shop'),
          actions: <Widget>[
            PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                if (selectedValue == FilterOptions.Favorites) {
                  setState(() {
                    _showOnlyFavorites = true;
                  });
                } else {
                  setState(() {
                    _showOnlyFavorites = false;
                  });
                }
              },
              icon: const Icon(Icons.more_vert),
              itemBuilder: (_) => [
                const PopupMenuItem(
                  child: Text('Only Favorites'),
                  value: FilterOptions.Favorites,
                ),
                const PopupMenuItem(
                  child: Text('Show All'),
                  value: FilterOptions.All,
                ),
              ],
            ),
            Consumer<Cart>(
                builder: (context, value, child) => Badge(
                    child: child as Widget, value: value.itemCount.toString()),
                child: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {},
                )),
          ],
        ),
        body: ProductsGrid(_showOnlyFavorites));
  }
}
