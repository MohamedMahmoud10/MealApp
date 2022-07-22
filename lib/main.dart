import 'package:flutter/material.dart';
import './dummy_data%20(1).dart';
import './moduels/meal.dart';
import './screens/filter_screen.dart';
import './screens/tabs_screen.dart';
import './screens/CategoryMealScreen.dart';
import './screens/meal_detail_screen.dart';
import '../screens/categoryScreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'glutenFree': false,
    'vegan': false,
    'vegetarian': false,
    'lactoseFree': false
  };
  List<Meal> _avaliableMeals = DUMMY_MEALS;
  List<Meal> _favMeal = [];

  void _setFilters(Map<String, bool> _filterData) {
    setState(() {
      _filters = _filterData;
      _avaliableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['glutenFree']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        if (_filters['lactoseFree']! && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFav(String mealId) {
    final existingMeal = _favMeal.indexWhere((meal) => meal.id == mealId);
    if (existingMeal >= 0) {
      setState(() {
        _favMeal.removeAt(existingMeal);
      });
    } else {
      setState(() {
        _favMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isFavourite(String id) {
    return _favMeal.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color.fromRGBO(224, 168, 0, 1), //GoldenRod
          secondary: Color.fromARGB(255, 231, 116, 132), //Terra Cotta
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 238, 240, 242),
        canvasColor: const Color.fromARGB(255, 238, 240, 242),
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: const TextStyle(
              fontFamily: 'Raleway',
              fontSize: 20,
            ),
            subtitle1: const TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 25,
                fontWeight: FontWeight.w700),
            bodyText2: const TextStyle(
              fontFamily: 'Raleway',
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            )),
      ),
      // home: MyHomePage(),
      //home: const CategoryItem(),
      routes: {
        '/': (context) => TabsScreen(_favMeal),
        CategoryMealScreen.routeName: (context) =>
            CategoryMealScreen(_avaliableMeals),
        MealDetailScrenn.routeName: (context) =>
            MealDetailScrenn(_toggleFav, _isFavourite),
        FilterScreen.routeName: (context) =>
            FilterScreen(_filters, _setFilters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Meal App'),
        ),
        body: null);
  }
}
