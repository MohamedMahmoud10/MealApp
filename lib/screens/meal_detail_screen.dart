import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app_2/dummy_data%20(1).dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class MealDetailScrenn extends StatelessWidget {
  final Function(String id) _isFavourite;
  final Function(String id) _toggleFav;

  MealDetailScrenn(this._toggleFav, this._isFavourite);

  static const routeName = 'MealDetailScreen';

  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute.of(context)!.settings.arguments as String;
    final mealDetail = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(_isFavourite(mealId) ? Icons.star : Icons.star_border),
        onPressed: () {
          showToast(
              !_isFavourite(mealId)
                  ? '${mealDetail.title} added To Favourite'
                  : 'Cancled',
              context: context,
              onDismiss: _toggleFav(mealId),
              position: StyledToastPosition.center,
              borderRadius: BorderRadius.circular(10),
              textStyle: const TextStyle(
                  fontFamily: 'Raleway',
                  fontStyle: FontStyle.italic,
                  color: Colors.white),
              backgroundColor: Colors.black54);
        },
      ),
      appBar: AppBar(title: Text(mealDetail.title)),
      body: Stack(children: [
        Image.network(
          mealDetail.imageUrl,
          height: 300,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Padding(
          padding: EdgeInsets.only(top: 270),
          child: Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            height: double.infinity - 300,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(35),
                topLeft: Radius.circular(35),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                    width: 400,
                    margin: const EdgeInsets.only(top: 20, left: 10),
                    child: Text(
                      mealDetail.title,
                      style: Theme.of(context).textTheme.headline2,
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.clip,
                    )),
                const SizedBox(height: 20),
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
              ]),
            ),
          ),
        ),
      ]),
    );
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
