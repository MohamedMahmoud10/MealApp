import 'package:flutter/material.dart';
import 'package:meal_app_2/screens/CategoryMealScreen.dart';

class CategoryItems extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  final String image;

  CategoryItems({Key? key, required this.id, required this.title, required this.color,required this
  .image}) : super(key: key);

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
      borderRadius: BorderRadius.circular(20),
      splashColor: color,
      child: Container(
       padding: const  EdgeInsets.all(10),
        child: Column(
          children: [
            Image.network(image,height: 100,fit: BoxFit.cover,),
            Text(title,style: Theme.of(context).textTheme.bodyText1,),
          ],
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin:Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              color.withOpacity(0.2),color
            ],
          ),borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }
}
