import 'package:flutter/material.dart';
import 'package:my_playground3/dummy_data.dart';
import './category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('DeliMeal'),
        ),
        body: GridView(
          padding: EdgeInsets.all(25),
          children: DUMMY_CATEGORIES
              .map((data) => CategoryItem(data.title, data.color))
              .toList(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
        ));
  }
}
