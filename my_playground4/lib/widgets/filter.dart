import 'package:flutter/material.dart';
import 'package:my_playground4/widgets/side_menu.dart';

class Filter extends StatefulWidget {
  static const routeName = '/filters';

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  var _glutenFree = false;
  var _lactosFree = false;
  var _vegetarian = false;
  var _vegan = false;

  Widget _buildSwitchFilter(
      String title, String subtitle, bool value, void Function(bool) onChange) {
    return Container(
      child: SwitchListTile(
          title: Text(title),
          value: value,
          subtitle: Text(subtitle),
          onChanged: onChange),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filter'),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.save))],
        ),
        drawer: SideMenu(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your filter',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            _buildSwitchFilter('Gluten-free', 'Gluten-free filter', _glutenFree,
                (newValue) {
              setState(() {
                _glutenFree = newValue;
              });
            }),
            _buildSwitchFilter('Lactos-free', 'Lactos-free filter', _lactosFree,
                (newValue) {
              setState(() {
                _lactosFree = newValue;
              });
            }),
            _buildSwitchFilter(
              'Vegetarian',
              'Vegetarian filter',
              _vegetarian,
              (newValue) {
                setState(() {
                  _vegetarian = newValue;
                });
              },
            ),
            _buildSwitchFilter(
              'Vegan',
              'Vegan filter',
              _vegan,
              (newValue) {
                setState(() {
                  _vegan = newValue;
                });
              },
            ),
          ],
        ));
  }
}
