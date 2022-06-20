import 'package:flutter/material.dart';

class Favorites extends StatelessWidget {
  List<String> favoriteMeals;

  Favorites(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    print('favorite');
    print(favoriteMeals);
    return Container(
      child: Center(child: Text('Favorites')),
    );
  }
}
