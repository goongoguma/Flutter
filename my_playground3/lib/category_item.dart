import 'package:flutter/material.dart';
import 'package:my_playground3/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return CategoryMealsScreen(id, title);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      // splashColor: Theme.of(context).primaryColor,
      splashColor: Colors.black,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.5), color],
                begin: Alignment.bottomLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}