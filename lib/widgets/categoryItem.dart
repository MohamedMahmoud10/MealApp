import 'package:flutter/material.dart';
import 'package:meal_app_2/screens/CategoryMealScreen.dart';

class CategoryItems extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItems({Key? key, required this.id, required this.title, required this.color}) : super(key: key);

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealScreen.routeName,arguments: {
      'id':id,
      'title':title
    });
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectMeal(context),
      borderRadius: BorderRadius.circular(15),
      splashColor: color,
      child: Container(
       padding: const EdgeInsets.all(10),
        child: Text(title,style: Theme.of(context).textTheme.bodyText2,),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [color, color.withOpacity(0.1)])),
      ),
    );
  }
}
