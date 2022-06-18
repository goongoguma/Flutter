import 'package:flutter/material.dart';
import 'package:my_playground4/widgets/grid_item_detail.dart';
import 'package:my_playground4/widgets/grid_item_detail_item.dart';
import '../dummy/dummy.dart';
import '../models/meal.dart';

class GridItemDetailList extends StatefulWidget {
  static const routeName = '/grid-item-detail';
  List<Meal> meals;

  GridItemDetailList(this.meals);

  @override
  State<GridItemDetailList> createState() => _GridItemDetailListState();
}

class _GridItemDetailListState extends State<GridItemDetailList> {
  List<Meal> _filteredMeals = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    _filteredMeals = widget.meals
        .where((meal) => meal.categories.contains(routeArgs['id']))
        .toList();

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final routeProps =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    return Scaffold(
        appBar: AppBar(title: Text(routeProps['title'] as String)),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return GridItemDetail(
              id: _filteredMeals[index].id,
              title: _filteredMeals[index].title,
              imageUrl: _filteredMeals[index].imageUrl,
              duration: _filteredMeals[index].duration,
              affordability: _filteredMeals[index].affordability,
              complexity: _filteredMeals[index].complexity,
            );
          },
          itemCount: _filteredMeals.length,
        ));
  }
}
