import 'package:flutter/material.dart';
import 'package:my_playground4/widgets/side_menu.dart';
import '../models/meal.dart';

class Filter extends StatefulWidget {
  static const routeName = '/filters';
  Map<String, bool> filters;
  void Function(Map<String, bool>) setFilters;
  void Function(Map<String, bool>) onChangeFilter;

  Filter(this.filters, this.setFilters, this.onChangeFilter);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  Widget _buildSwitchFilter(
      String title, String subtitle, bool value, void Function(bool) onChange) {
    print(value);
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
                widget.filters['isGlutenFree'] as bool, (newValue) {
              widget.setFilters({
                ...widget.filters,
                'isGlutenFree': newValue,
              });
              widget.onChangeFilter({
                ...widget.filters,
                'isGlutenFree': newValue,
              });
            }),
            _buildSwitchFilter('Lactos-free', 'Lactos-free filter',
                widget.filters['isLactosFree'] as bool, (newValue) {
              setState(() {
                widget.filters = {
                  ...widget.filters,
                  'isLactosFree': newValue,
                };
              });
              widget.onChangeFilter({
                ...widget.filters,
                'isLactosFree': newValue,
              });
            }),
            _buildSwitchFilter('Vegetarian', 'Vegetarian filter',
                widget.filters['isVegetarian'] as bool, (newValue) {
              setState(() {
                widget.filters = {
                  ...widget.filters,
                  'isVegetarian': newValue,
                };
              });
              widget.onChangeFilter({
                ...widget.filters,
                'isVegetarian': newValue,
              });
            }),
            _buildSwitchFilter(
                'Vegan', 'Vegan filter', widget.filters['isVegan'] as bool,
                (newValue) {
              setState(() {
                widget.filters = {
                  ...widget.filters,
                  'isVegan': newValue,
                };
              });
              widget.onChangeFilter({
                ...widget.filters,
                'isVegan': newValue,
              });
            }),
          ],
        ));
  }
}
