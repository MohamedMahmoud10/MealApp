import 'package:flutter/material.dart';
import 'package:meal_app_2/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:Column(
        children: [
             Container(
               padding: EdgeInsets.all(10),
               alignment: Alignment.centerLeft,
              height: 200,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const  BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),

              ),
              width: double.infinity,
              child: const Text('Cooking UP!',style: TextStyle(color: Colors.black,fontSize: 30),),
          ),
          const SizedBox(height: 5,),
          buildListTile('Categor Meals',Icons.category,()=>Navigator.of(context).pushNamed('/')),
          SizedBox(height: 10,),
          buildListTile('Filters ',Icons.settings,()=>Navigator.of(context).pushNamed(FilterScreen.routeName)),
        ],
      ) ,
    );
  }

  ListTile buildListTile(String text , IconData icon , Function()onTap) {
    return ListTile(
          leading: Icon(icon),
          title: Text(text),
          onTap: onTap,
    trailing: const Icon(
    Icons.arrow_right_rounded,
    size: 35,)

        );
  }
}
