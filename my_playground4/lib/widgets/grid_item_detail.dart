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

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unkown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Luxurious:
        return 'Expensive';
      case Affordability.Pricey:
        return 'Pricey';
      default:
        return 'Unknown';
    }
  }

  void onClickMeal(String title) {
    print(title);
  }

  @override
  Widget build(BuildContext context) {
    const staticBorderRadius = BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
      bottomLeft: Radius.circular(20),
      bottomRight: Radius.circular(20),
    );

    return InkWell(
      onTap: () => onClickMeal(title),
      child: Card(
          shape: const RoundedRectangleBorder(borderRadius: staticBorderRadius),
          margin: const EdgeInsets.all(10),
          color: Theme.of(context).colorScheme.secondary,
          elevation: 4,
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: staticBorderRadius),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.network(imageUrl, fit: BoxFit.cover),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      title,
                      style: const TextStyle(
                          fontSize: 17,
                          color: Colors.brown,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.watch, color: Colors.white),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(
                                '${duration}',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.leaderboard,
                                  color: Colors.white),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(
                                complexityText,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.money, color: Colors.white),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(
                                affordabilityText,
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          )
                        ],
                      ),
                    ))
              ],
            ),
          )),
    );
  }
}
