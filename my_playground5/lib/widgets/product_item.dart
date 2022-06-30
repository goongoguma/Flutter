import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/product_detail_screen.dart';
import '../provider/product.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Product>(
        builder: (context, value, _) => ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                      arguments: value.id);
                },
                child: GridTile(
                    child: Image.network(value.imageUrl, fit: BoxFit.cover),
                    footer: GridTileBar(
                      backgroundColor: Colors.black54,
                      leading: IconButton(
                        onPressed: () {
                          value.toggleFavorite();
                        },
                        icon: Icon(value.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border),
                      ),
                      title: Text(
                        value.title,
                        textAlign: TextAlign.center,
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.shopping_cart),
                      ),
                    )),
              ),
            ));
  }
}
