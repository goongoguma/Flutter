import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/product_detail_screen.dart';
import '../provider/product.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final item = Provider.of<Product>(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(ProductDetailScreen.routeName, arguments: item.id);
        },
        child: GridTile(
            child: Image.network(item.imageUrl, fit: BoxFit.cover),
            footer: GridTileBar(
              backgroundColor: Colors.black54,
              leading: IconButton(
                onPressed: () {
                  item.toggleFavorite();
                },
                icon: Icon(
                    item.isFavorite ? Icons.favorite : Icons.favorite_border),
              ),
              title: Text(
                item.title,
                textAlign: TextAlign.center,
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_cart),
              ),
            )),
      ),
    );
  }
}
