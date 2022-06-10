import 'package:flutter/material.dart';
import 'package:my_playground4/widgets/grid_item.dart';
import 'package:my_playground4/widgets/home.dart';
import '../widgets/favorites.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Meals'),
            bottom: const TabBar(tabs: [
              Tab(
                  icon: Icon(
                    Icons.home,
                  ),
                  text: 'Home'),
              Tab(icon: Icon(Icons.star), text: 'Favorites')
            ]),
          ),
          body: TabBarView(children: [Home(), Favorites()]),
        ));
  }
}
