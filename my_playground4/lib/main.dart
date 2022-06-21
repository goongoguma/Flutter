import 'package:my_playground4/dummy/dummy.dart';

import './models/meal.dart';
import 'package:flutter/material.dart';
import 'package:my_playground4/widgets/favorites.dart';
import 'package:my_playground4/widgets/grid_item_detail_item.dart';
import 'package:my_playground4/widgets/grid_item_detail_list.dart';
import 'package:my_playground4/widgets/tabs.dart';
import './widgets/filter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> meals = DUMMY_MEALS;
  List<String> _favoriteMeals = [];

  Map<String, bool> _filters = {
    'isGlutenFree': false,
    'isVegan': false,
    'isVegetarian': false,
    'isLactosFree': false,
  };

  void _setFilters(filters) {
    setState(() {
      _filters = filters;
    });
    setState(() {
      meals = DUMMY_MEALS.where((meal) {
        if (filters['isGlutenFree'] && meal.isGlutenFree) {
          return true;
        }
        if (filters['isVegan'] && meal.isVegan) {
          return true;
        }
        if (filters['isVegetarian'] && meal.isVegetarian) {
          return true;
        }
        if (filters['isLactosFree'] && meal.isLactoseFree) {
          return true;
        }
        return false;
      }).toList();
    });
  }

  void _setFavorite(String id) {
    if (_favoriteMeals.contains(id)) {
      setState(() {
        _favoriteMeals.remove(id);
      });
    } else {
      setState(() {
        _favoriteMeals.add(id);
      });
    }
  }

  // meals를 GridItemDetailList에 전달해야함
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Playground 4',
      theme: ThemeData(
        canvasColor: Color.fromARGB(248, 207, 214, 207),
        // brightness: Brightness.dark),
      ).copyWith(
          colorScheme: ThemeData().colorScheme.copyWith(
              primary: Colors.deepOrange, secondary: Colors.orangeAccent)),
      // initialRoute: '/',
      routes: {
        '/': (context) => Tabs(_favoriteMeals),
        GridItemDetailList.routeName: (context) => GridItemDetailList(meals),
        GridItemDetailItem.routeName: (context) =>
            GridItemDetailItem(_favoriteMeals, _setFavorite),
        Filter.routeName: (context) => Filter(_filters, _setFilters),
      },
    );
  }
}
