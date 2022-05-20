import 'package:flutter/material.dart';
import '../dummy_data%20(1).dart';
import '../moduels/meal.dart';
import '../widgets/Meal_widget.dart';

class CategoryMealScreen extends StatefulWidget {
  final List<Meal> avaliableMeals;

  CategoryMealScreen(this.avaliableMeals, {Key? key}) : super(key: key);
  static const routeName = 'CategoryMealScreen';

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String? categoryTitle;
  List<Meal> categoryMeals = <Meal>[];

  @override
  void didChangeDependencies() {
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categorId = routeArg['id'];
    categoryTitle = routeArg['title'];
    categoryMeals = widget.avaliableMeals.where((meal) {
      return meal.categories.contains(categorId);
    }).toList();
    super.didChangeDependencies();
  }

  // void _removeMeal(String mealId) {
  //   setState(() {
  //     categoryMeals.removeWhere((meal) => meal.id == mealId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        '${categoryTitle}',
        style: const TextStyle(
            fontSize: 25, fontStyle: FontStyle.italic, color: Colors.black87),
      )),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeals[index].id,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
            title: categoryMeals[index].title,

          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
