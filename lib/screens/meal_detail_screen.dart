import 'package:flutter/material.dart';
import 'package:meal_app_2/dummy_data%20(1).dart';
import 'package:meal_app_2/moduels/meal.dart';

class MealDetailScrenn extends StatelessWidget {
  final Function(String id) _isFavourite;
  final Function(String id)_toggleFav;
  MealDetailScrenn(this._toggleFav,this._isFavourite);
  static const routeName = 'MealDetailScreen';


  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute.of(context)!.settings.arguments as String;
    final mealDetail = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed:()=> _toggleFav(mealId),
        child: Icon(
            _isFavourite(mealId)?Icons.star:Icons.star_border
        ),
      ),
        appBar: AppBar(title: Text(mealDetail.title)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 250,
                child: Image.network(
                  mealDetail.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildContainer1(context, 'Ingredients'),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: buildContainer(
                  ListView.builder(
                    itemBuilder: (ctx, index) {
                      return Card(
                        color: Colors.teal,
                        margin: const EdgeInsets.all(7),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(mealDetail.ingredients[index]),
                        ),
                      );
                    },
                    itemCount: mealDetail.ingredients.length,
                  ),
                ),
              ),
              buildContainer1(context, 'Steps'),
              buildContainer(ListView.builder(
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('${index + 1}'),
                        ),
                        title: Text(mealDetail.steps[index]),
                      ),
                      const Divider(),
                    ],
                  );
                },
                itemCount: mealDetail.steps.length,
              ))
            ],
          ),
        ));
  }

  Container buildContainer1(BuildContext ctx, String text) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Text(text, style: Theme.of(ctx).textTheme.bodyText2),
    );
  }

  Container buildContainer(Widget child) {
    return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black54),
        ),
        height: 150,
        width: 300,
        child: child);
  }
}
