import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  GridItem(this.id, this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Theme.of(context).colorScheme.tertiary,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color.withOpacity(0.5), color],
            ),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
