import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cart.dart' show Cart;
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cartItem = Provider.of<Cart>(context).items;
    return Scaffold(
        appBar: AppBar(title: const Text('Cart')),
        body: Column(
          children: [
            Card(
              margin: const EdgeInsets.all(15),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Spacer(),
                    Chip(
                      label: const Text(
                        'total amount',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text('ORDER NOW!'),
                        style: TextButton.styleFrom(
                            primary: Theme.of(context).colorScheme.secondary))
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: cartItem.length,
                    itemBuilder: (context, index) => CartItem(
                        productId: cartItem.keys.toList()[index],
                        id: cartItem.values.toList()[index]!.id,
                        title: cartItem.values.toList()[index]!.title,
                        quantity: cartItem.values.toList()[index]!.quantity,
                        price: cartItem.values.toList()[index]!.price)))
          ],
        ));
  }
}
