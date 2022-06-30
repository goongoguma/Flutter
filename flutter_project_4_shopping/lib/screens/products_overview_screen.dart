import 'package:flutter/material.dart';
import 'package:flutter_project_shopping/provider/products.dart';
import 'package:provider/provider.dart';
import '../provider/product.dart';
import '../widgets/products_grid.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProduceOverviewScreen extends StatefulWidget {
  @override
  State<ProduceOverviewScreen> createState() => _ProduceOverviewScreenState();
}

class _ProduceOverviewScreenState extends State<ProduceOverviewScreen> {
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
            )
          ],
        ),
        body: ProductsGrid(_showOnlyFavorites));
  }
}
