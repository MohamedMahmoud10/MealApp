import 'package:flutter/material.dart';
import '../moduels/meal.dart';
import '../widgets/Meal_widget.dart';
class FavScreen extends StatelessWidget {
  List<Meal>favMeal=[];
  FavScreen(this.favMeal);

  @override
  Widget build(BuildContext context) {
    if(favMeal.isEmpty){
      return Center(
        child: Text('You have not favourite yet!!_Start adding some :)'),
      );
    }
    else{
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem (
            id: favMeal[index].id,
            imageUrl: favMeal[index].imageUrl,
            duration: favMeal[index].duration,
            complexity: favMeal[index].complexity,
            affordability: favMeal[index].affordability,
            title: favMeal[index].title,
          );
        },
        itemCount: favMeal.length,
      );
    }

  }
}
