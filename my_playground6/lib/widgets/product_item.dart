import 'package:flutter/material.dart';
import 'package:my_playground6/provider/product.dart';
import 'package:provider/provider.dart';
import '../provider/product.dart';
import '../provider/products.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    return Consumer<Product>(
      builder: (context, value, _) => ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GestureDetector(
          onTap: () {},
          child: GridTile(
            child: Image.network(
              value.imageUrl,
            ),
            footer: GridTileBar(
              leading: IconButton(
                onPressed: () {
                  value.onChangeFavorite();
                  products.addFavorite(value);
                },
                icon: value.isFavorite
                    ? Icon(Icons.favorite)
                    : Icon(Icons.favorite_border),
              ),
              title: Text(
                value.title,
                textAlign: TextAlign.center,
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_bag),
              ),
              backgroundColor: Colors.black54,
            ),
          ),
        ),
      ),
    );
  }
}
