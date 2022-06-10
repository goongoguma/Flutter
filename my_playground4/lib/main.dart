import 'package:flutter/material.dart';
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
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)
            .copyWith(secondary: Colors.green),
        canvasColor: Color.fromARGB(249, 220, 224, 220),
        // brightness: Brightness.dark),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Tabs(),
        GridItemDetailList.routeName: (context) => GridItemDetailList()
      },
    );
  }
}
