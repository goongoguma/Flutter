import 'package:flutter/material.dart';
import '../dummy/dummy.dart';
import 'grid_item.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
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
          ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.star),
        onPressed: () {},
        // onPressed: () {
        //   Navigator.of(context).pop(mealId);
        // },
      ),
    );
  }
}
