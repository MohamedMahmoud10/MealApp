import 'package:flutter/material.dart';
import '../widgets/categoryItem.dart';
import '../dummy_data%20(1).dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
          padding: const EdgeInsets.all(15),
          children: DUMMY_CATEGORIES
              .map((catData) => CategoryItems(
                    id: catData.id,
                    title: catData.title,
                    color: catData.color,
                    image: catData.image,
                  ))
              .toList(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          )),
    );
  }
}
