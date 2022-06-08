import 'package:flutter/material.dart';
import 'package:my_playground4/widgets/grid_item_detail_list.dart';
import './dummy/dummy.dart';
import './widgets/grid_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        colorScheme: ThemeData().colorScheme.copyWith(
            secondary: Colors.pink[300],
            tertiary: Colors.purple[200],
            brightness: Brightness.dark),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {GridItemDetailList.routeName: (context) => GridItemDetailList()},
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: GridView(
            padding: EdgeInsets.all(10),
            children: DUMMY_CATEGORIES
                .map((category) =>
                    GridItem(category.id, category.title, category.color))
                .toList(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? 2
                      : 3,
              childAspectRatio: 1,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            )
            // gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            //   maxCrossAxisExtent: 200,
            //   crossAxisSpacing: 10,
            //   mainAxisSpacing: 10,
            // ),
            ));
  }
}
