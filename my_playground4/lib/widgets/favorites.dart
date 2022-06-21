import 'package:flutter/material.dart';
import 'package:my_playground4/dummy/dummy.dart';
import 'package:my_playground4/widgets/grid_item.dart';
import './grid_item.dart';

import '../models/meal.dart';
import 'grid_item_detail.dart';

class Favorites extends StatefulWidget {
  final List<String> favoriteMeals;

  Favorites(this.favoriteMeals);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  late List<Meal> _favoriteState;

  void initState() {
    final List<Meal> selectedMeals = DUMMY_MEALS
        .where((meals) => widget.favoriteMeals.contains(meals.id))
        .toList();
    _favoriteState = selectedMeals;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(_favoriteState);
    return Container(
        child: _favoriteState.isEmpty
            ? Center(
                child: Text(
                'No Favorites yet',
              ))
            : ListView.builder(
                itemBuilder: (context, index) {
                  return GridItemDetail(
                    id: _favoriteState[index].id,
                    title: _favoriteState[index].title,
                    imageUrl: _favoriteState[index].imageUrl,
                    duration: _favoriteState[index].duration,
                    affordability: _favoriteState[index].affordability,
                    complexity: _favoriteState[index].complexity,
                  );
                },
                itemCount: _favoriteState.length,
              ));
  }
}
