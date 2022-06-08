import 'package:flutter/material.dart';
import 'package:my_playground4/widgets/grid_item_detail.dart';
import '../dummy/dummy.dart';
import '../models/meal.dart';

// 'id: ${routeProps['id']}, title: ${routeProps['title']}, color: ${routeProps['color']}',
class GridItemDetailList extends StatefulWidget {
  static const routeName = '/grid-item-detail';
  @override
  State<GridItemDetailList> createState() => _GridItemDetailListState();
}

class _GridItemDetailListState extends State<GridItemDetailList> {
  List<Meal> _filteredMeals = DUMMY_MEALS;

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    setState(() {
      _filteredMeals = DUMMY_MEALS
          .where((meal) => meal.categories.contains(routeArgs['id']))
          .toList();
    });

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final routeProps =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    return Scaffold(
      appBar: AppBar(title: Text(routeProps['title'] as String)),
      body: ListView.builder(itemBuilder: ((context, index) {
        return ListView.builder(
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
        );
      })),
    );
  }
}
