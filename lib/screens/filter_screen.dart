import 'package:flutter/material.dart';
import 'package:meal_app_2/widgets/maindrawer.dart';

class FilterScreen extends StatefulWidget {
  Map<String,bool> cuurentFilter;
  Function(Map<String, bool>) saveFilter;

  FilterScreen(this.cuurentFilter,this.saveFilter);
  static const routeName = 'filterScreen';

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;
@override
  void initState() {
   _glutenFree = widget.cuurentFilter['glutenFree']!;
   _vegan = widget.cuurentFilter['vegan']!;
   _vegetarian = widget.cuurentFilter['vegetarian']!;
   _lactoseFree = widget.cuurentFilter['lactoseFree']!;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: const Text('Filters'),
        actions: [
          IconButton(
              onPressed: () {
                final _selectedFilter = {
                  'glutenFree': _glutenFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                  'lactoseFree': _lactoseFree
                };
                widget.saveFilter(_selectedFilter);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: const Text('Adjust Your meal Section'),
        ),
        Expanded(
            child: ListView(
          children: [
            buildSwitchListTile(
                'GlutenFree', 'Only include glutenFree meals', _glutenFree,
                (newVal) {
              setState(() {
                _glutenFree = newVal;
              });
            }),
            buildSwitchListTile('Vegan', 'Only include vegan meals', _vegan,
                (newVal) {
              setState(() {
                _vegan = newVal;
              });
            }),
            buildSwitchListTile(
                'Vegetarian', 'Only include vegetarian meals', _vegetarian,
                (newVal) {
              setState(() {
                _vegetarian = newVal;
              });
            }),
            buildSwitchListTile(
                'LactoseFree', 'Only include lactoseFree meals', _lactoseFree,
                (newVal) {
              setState(() {
                _lactoseFree = newVal;
              });
            })
          ],
        )),
      ]),
    );
  }

  SwitchListTile buildSwitchListTile(
      String title, String subTitle, bool value, Function(bool) updatedValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subTitle),
        value: value,
        onChanged: updatedValue);
  }
}
