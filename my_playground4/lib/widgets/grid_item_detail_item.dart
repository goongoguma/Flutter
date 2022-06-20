import 'package:flutter/material.dart';
import '../dummy/dummy.dart';
import '../models/meal.dart';

class GridItemDetailItem extends StatefulWidget {
  static const routeName = '/grid-item-detail-item';
  final Function setFavorite;
  List<String> favoriteMeals;

  GridItemDetailItem(this.favoriteMeals, this.setFavorite);

  @override
  State<GridItemDetailItem> createState() => _GridItemDetailItemState();
}

class _GridItemDetailItemState extends State<GridItemDetailItem> {
  late Meal selectedMeal;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    final routeArgsId =
        (ModalRoute.of(context)!.settings.arguments as Map)['id'] as String;
    setState(() {
      selectedMeal =
          DUMMY_MEALS.firstWhere((element) => element.id == routeArgsId);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Ingredients',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Container(
              height: 150,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.indigo),
                  borderRadius: BorderRadius.circular(10)),
              child: ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: (context, index) => Card(
                        color: Theme.of(context).colorScheme.secondary,
                        child: Text(selectedMeal.ingredients[index]),
                      )),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Steps',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Container(
              height: 150,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.indigo),
                  borderRadius: BorderRadius.circular(10)),
              child: ListView.builder(
                  itemCount: selectedMeal.steps.length,
                  itemBuilder: (context, index) => Column(
                        children: [
                          ListTile(
                            leading:
                                CircleAvatar(child: Text('# ${index + 1}')),
                            title: Text(selectedMeal.steps[index]),
                          )
                        ],
                      )),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(widget.favoriteMeals.contains(selectedMeal.id)
              ? Icons.favorite
              : Icons.favorite_border),
          onPressed: () => widget.setFavorite(selectedMeal.id)),
    );
  }
}
