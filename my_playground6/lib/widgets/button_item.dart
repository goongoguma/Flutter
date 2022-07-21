import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cart.dart';
import '../provider/cart.dart' show Cart;

class ButtonItem extends StatelessWidget {
  final String flag;
  final String productId;

  ButtonItem(this.flag, this.productId);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final isAdd = flag == 'add';
    return GestureDetector(
      onTap: () => cart.controlQuantity(productId, isAdd),
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.brown,
        ),
        width: 20,
        height: 20,
        child: Center(
            child: isAdd
                ? Icon(
                    Icons.add,
                    size: 15,
                    color: Colors.white,
                  )
                : Icon(
                    Icons.remove,
                    size: 15,
                    color: Colors.white,
                  )),
      ),
    );
  }
}
