import 'package:flutter/material.dart';
import 'package:my_playground3/main_drawer.dart';

class FilterScreen extends StatelessWidget {
  static const routeName = '/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Page!'),
      ),
      drawer: MainDrawer(),
      body: const Center(
        child: Text('Filters'),
      ),
    );
  }
}
