import 'package:flutter/material.dart';
import 'package:flutter_project_shopping/provider/cart.dart';
import 'package:provider/provider.dart';
import '../screens/product_detail_screen.dart';
import '../provider/product.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // static한 상태와 같이 재렌더링이 필요 없을 경우 Provider.of의 listen: false를 사용하는것을 권장
    final cart = Provider.of<Cart>(context, listen: false);
    return Consumer<Product>(
      builder: (ctx, product, _) => ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                  arguments: product.id);
            },
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          header: Text(product.title),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: IconButton(
              icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border),
              onPressed: () {
                product.toggleFavoriteStatus();
              },
              color: Theme.of(context).accentColor,
            ),
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              onPressed: () {
                cart.addItem(product.id, product.price, product.title);
              },
              icon: Icon(Icons.shopping_cart),
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      ),
    );
  }
}
