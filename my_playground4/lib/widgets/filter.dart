import 'package:flutter/material.dart';
import 'package:my_playground4/widgets/side_menu.dart';
import '../models/meal.dart';

class Filter extends StatefulWidget {
  static const routeName = '/filters';
  Map<String, bool> filters;
  void Function(Map<String, bool>) setFilters;

  Filter(this.filters, this.setFilters);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  var _filterState = {};

  @override
  initState() {
    _filterState = widget.filters;
  }

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
            _buildSwitchFilter('Gluten-free', 'Gluten-free filter',
                _filterState['isGlutenFree'] as bool, (newValue) {
              setState(() {
                _filterState = {
                  ..._filterState,
                  'isGlutenFree': newValue,
                };
              });
              widget.setFilters({
                ..._filterState,
                'isGlutenFree': newValue,
              });
            }),
            _buildSwitchFilter('Lactos-free', 'Lactos-free filter',
                _filterState['isLactosFree'] as bool, (newValue) {
              setState(() {
                _filterState = {
                  ..._filterState,
                  'isLactosFree': newValue,
                };
              });
            }),
            _buildSwitchFilter('Vegetarian', 'Vegetarian filter',
                _filterState['isVegetarian'] as bool, (newValue) {
              setState(() {
                _filterState = {
                  ..._filterState,
                  'isVegetarian': newValue,
                };
              });
            }),
            _buildSwitchFilter(
                'Vegan', 'Vegan filter', _filterState['isVegan'] as bool,
                (newValue) {
              setState(() {
                _filterState = {
                  ..._filterState,
                  'isVegan': newValue,
                };
              });
            }),
          ],
        ));
  }
}
