import 'package:flutter/material.dart';
import 'package:flutter_project_shopping/provider/cart.dart';
import 'package:flutter_project_shopping/provider/products.dart';
import 'package:flutter_project_shopping/screens/cart_screen.dart';
import 'package:flutter_project_shopping/widgets/app_drawer.dart';
import 'package:provider/provider.dart';
import '../provider/product.dart';
import '../widgets/products_grid.dart';
import '../widgets/badge.dart';
import './cart_screen.dart';
import '../provider/cart.dart';
import 'package:provider/provider.dart';
import '../provider/products.dart';

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
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    // Future.delayed(Duration.zero).then((_) {
    //   Provider.of<Products>(context).fetchAndSetProducts();
    // });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Products>(context).fetchAndSetProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

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
              builder: (_, cart, ch) => Badge(
                child: ch as Widget,
                value: cart.itemCount.toString(),
              ),
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
              ),
            )
          ],
        ),
        drawer: AppDrawer(),
        body: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ProductsGrid(_showOnlyFavorites));
  }
}
