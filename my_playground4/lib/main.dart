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

  Map<String, bool> _filters = {
    'isGlutenFree': false,
    'isVegan': false,
    'isVegetarian': false,
    'isLactosFree': false,
  };

  void _setFilters(filters) {
    print(filters);
    setState(() {
      meals = DUMMY_MEALS.where((meal) {
        if (filters['isGlutenFree'] as bool && meal.isGlutenFree) {
          return true;
        }
        if (filters['isVegan'] as bool && meal.isVegan) {
          return true;
        }
        if (filters['isVegetarian'] as bool && meal.isVegetarian) {
          return true;
        }
        if (filters['isLactosFree'] as bool && meal.isLactoseFree) {
          return true;
        }
        return false;
      }).toList();
    });
  }

  void onChangeFilter(newFilter) {
    setState(() {
      _filters = newFilter;
    });
  }

  // meals를 GridItemDetailList에 전달해야함
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Playground 4',
      theme: ThemeData(
        canvasColor: Color.fromARGB(249, 220, 224, 220),
        // brightness: Brightness.dark),
      ).copyWith(
          colorScheme: ThemeData().colorScheme.copyWith(
              primary: Colors.deepOrange, secondary: Colors.orangeAccent)),
      initialRoute: '/',
      routes: {
        '/': (context) => Tabs(),
        GridItemDetailList.routeName: (context) => GridItemDetailList(meals),
        GridItemDetailItem.routeName: (context) => GridItemDetailItem(),
        Filter.routeName: (context) =>
            Filter(_filters, _setFilters, onChangeFilter),
      },
    );
  }
}
