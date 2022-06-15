import 'package:flutter/material.dart';
import './filter.dart';
import './favorites.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.primary,
            child: const Text(
              'Side Menu',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
        const SizedBox(
          height: 20,
        ),
        ListTile(
          leading: Icon(
            Icons.menu_book,
            size: 26,
          ),
          title: Text('Meals'),
          onTap: () => Navigator.of(context).pushReplacementNamed('/'),
        ),
        ListTile(
          leading: Icon(
            Icons.settings,
            size: 26,
          ),
          title: Text('Filters'),
          onTap: () =>
              Navigator.of(context).pushReplacementNamed(Filter.routeName),
        )
      ],
    ));
  }
}
