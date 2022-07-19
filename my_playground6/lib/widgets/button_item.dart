import 'package:flutter/material.dart';

class ButtonItem extends StatelessWidget {
  final String flag;

  ButtonItem(this.flag);

  @override
  Widget build(BuildContext context) {
    final isAdd = flag == 'add';
    return Container(
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
    );
  }
}
