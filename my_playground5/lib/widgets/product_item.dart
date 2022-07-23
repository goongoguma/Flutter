import 'package:flutter/material.dart';
import 'package:my_playground5/provider/cart.dart';
import 'package:provider/provider.dart';
import '../screens/product_detail_screen.dart';
import '../provider/product.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
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
                        onPressed: () {
                          cart.addItem(value.id, value.price, value.title);
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Added item to cart!'),
                            duration: Duration(seconds: 2),
                            action: SnackBarAction(
                                label: 'UNDO',
                                onPressed: () =>
                                    cart.removeSingleItem((value.id))),
                          ));
                        },
                        icon: Icon(Icons.shopping_cart),
                      ),
                    )),
              ),
            ));
  }
}
