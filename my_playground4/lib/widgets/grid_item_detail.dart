import 'package:flutter/material.dart';
import 'package:my_playground4/widgets/grid_item.dart';
import '../models/meal.dart';

class GridItemDetail extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Affordability affordability;
  final Complexity complexity;

  GridItemDetail({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.affordability,
    required this.complexity,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text('Image'),
        ),
        Container(child: Text('Description'))
      ],
    );
  }
}
