import 'package:flutter/material.dart';
import '../moduels/meal.dart';
import '/screens/categoryScreen.dart';
import '../widgets/maindrawer.dart';
import '/screens/CategoryMealScreen.dart';
import '/screens/favourite_screen.dart';

class TabsScreen extends StatefulWidget {
  List<Meal>favMeal=[];
  TabsScreen(this.favMeal);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
     List<Map<String, Object>> pages=[];
  int selectPageIndex = 0;

  void selectItem(int value) {
    setState(() {
      selectPageIndex = value;
    });
  }
@override
  void initState() {
    pages = [
      {'page': const CategoryItem(), 'title': 'Category Meals'},
      {'page':  FavScreen(widget.favMeal), 'title': 'Favourite Itme'}
    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: Text(pages[selectPageIndex]['title'].toString()),
      ),
      body: pages[selectPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.teal,
        selectedItemColor: Colors.white,
        currentIndex: selectPageIndex,
        onTap: selectItem,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
            ),
            label: 'Category',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favourite')
        ],
      ),
    );
  }
}
