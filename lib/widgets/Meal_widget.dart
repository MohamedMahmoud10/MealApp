import 'package:flutter/material.dart';
import '../screens/meal_detail_screen.dart';
import '../moduels/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    Key? key,
    required this.id,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.title,
  }) : super(key: key);

  void selcetmeal(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(MealDetailScrenn.routeName, arguments: id)
        .then((result) => {
              if (id != null)
                {
                  //removeItem
                }
            });
  }

  String get complexityText {
    switch (complexity) {
      case Complexity.hard:
        return 'Hard';
      case Complexity.challenging:
        return 'Challenging';
      case Complexity.simple:
        return 'Simple';
      default:
        return 'UnKnown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.affordable:
        return 'Affordable';
      case Affordability.luxurious:
        return 'Luxurious';
      case Affordability.pricey:
        return 'Pricey';
      default:
        return 'UnKnown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selcetmeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  child: Image.network(
                    imageUrl,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(40)),
                        color: Colors.black54),
                    width: 300,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    child: Text(
                      title,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      style: const TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontSize: 25),
                    ),
                  ),
                ),
                Positioned(bottom: 10  ,right: 5,
                child: FloatingActionButton(
                  heroTag: null,
                  onPressed: (){},
                  child:Icon(Icons.star,color: Colors.pink,) ,
                ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildRow(Icons.access_time, '${duration}'),
                  const SizedBox(
                    width: 10,
                  ),
                  buildRow(Icons.work, complexityText),
                  const SizedBox(
                    width: 10,
                  ),
                  buildRow(Icons.monetization_on, affordabilityText)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildRow(IconData icon, String text) {
    return Row(
      children: [Icon(icon), Text(text)],
    );
  }
}
