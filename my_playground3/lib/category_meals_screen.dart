import 'package:flutter/material.dart';
import './dummy_data.dart';
import './meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final title = routeArgs['title'];
    final id = routeArgs['id'];
    final meals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(id);
    }).toList();
    return Scaffold(
        appBar: AppBar(title: Text(title as String)),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
                id: meals[index].id,
                title: meals[index].title,
                imageUrl: meals[index].imageUrl,
                duration: meals[index].duration,
                affordability: meals[index].affordability,
                complexity: meals[index].complexity);
          },
          itemCount: meals.length,
        ));
  }
}
