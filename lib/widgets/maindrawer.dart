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
               alignment: Alignment.center,
              color: Colors.teal,
              height: 100,
              width: double.infinity,
              child: const Text('Cooking UP!',style: TextStyle(color: Colors.white) ,),
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
        );
  }
}
