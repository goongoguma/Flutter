import 'package:flutter/material.dart';
import 'package:my_playground4/widgets/grid_item_detail_item.dart';
import 'package:my_playground4/widgets/grid_item_detail_list.dart';
import 'package:my_playground4/widgets/tabs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
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
        GridItemDetailList.routeName: (context) => GridItemDetailList(),
        GridItemDetailItem.routeName: (context) => GridItemDetailItem()
      },
    );
  }
}
