import 'package:flutter/material.dart';
import 'package:my_playground4/widgets/grid_item.dart';
import 'package:my_playground4/widgets/home.dart';
import '../widgets/favorites.dart';
import './side_menu.dart';

class Tabs extends StatefulWidget {
  List<String> favoriteMeals;

  Tabs(this.favoriteMeals);

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  late List<Map<String, dynamic>> _pages;
  int _selectedPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    _pages = [
      {'page': Home(), 'title': 'Home'},
      {'page': Favorites(widget.favoriteMeals), 'title': 'Favorites'}
    ];
    super.initState();
  }

  void _onChangePages(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.favoriteMeals);
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPage]['title']),
      ),
      drawer: SideMenu(),
      body: _pages[_selectedPage]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onChangePages,
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPage,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites')
        ],
      ),
    );
  }
}
