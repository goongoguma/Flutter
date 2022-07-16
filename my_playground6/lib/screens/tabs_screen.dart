import 'package:flutter/material.dart';
import 'package:my_playground6/screens/favorite_screen.dart';
import 'package:my_playground6/screens/home_screen.dart';
import '../widgets/badge.dart';
import 'package:provider/provider.dart';
import '../provider/cart.dart';

class TabsScreen extends StatefulWidget {
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;
  late final List<Map<String, dynamic>> _pages = [
    {'page': HomeScreen(), 'title': 'Home'},
    {'page': FavoriteScreen(), 'title': 'My Favorite'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_selectedIndex]['title']), actions: [
        // builder안의 child는 Consumer의 child임
        Consumer<Cart>(
          builder: (_, cartObj, child) => Badge(
            child: child as Widget,
            value: cartObj.itemCount.toString(),
          ),
          child: IconButton(
              onPressed: () {}, icon: Icon(Icons.shopping_bag_rounded)),
        )
      ]),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black54,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
        ],
      ),
    );
  }
}
