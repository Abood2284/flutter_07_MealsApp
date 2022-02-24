import 'package:flutter/material.dart';

import '../widget/main_drawer.dart';

class FillteredScreen extends StatefulWidget {
  static const routeName = 'filteredScreen';


  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FillteredScreen(this.currentFilters, this.saveFilters);

  @override
  State<FillteredScreen> createState() => _FillteredScreenState();
}

class _FillteredScreenState extends State<FillteredScreen> {
  var _lactoseFree = false;
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'] as bool;
    _lactoseFree = widget.currentFilters['lactose'] as bool;
    _vegetarian = widget.currentFilters['vegetarian'] as bool;
    _vegan = widget.currentFilters['vegan'] as bool;
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function(bool) tapHandler,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Filters')),
      drawer: MainDrawer(),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Text('Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6),
        ),
        Expanded(
            child: ListView(
          children: [
            _buildSwitchListTile(
                'Gluten-free', 'Only include gluten-free meals', _glutenFree,
                (newValue) {
              setState(() {
                _glutenFree = newValue;
              });
            }),
            _buildSwitchListTile(
                'Lactose-free', 'Only include Lactose-free meals', _lactoseFree,
                (newValue) {
              setState(() {
                _lactoseFree = newValue;
              });
            }),
            _buildSwitchListTile(
                'Vegetarian', 'Only include vegetarian meals', _vegetarian,
                (newValue) {
              setState(() {
                _vegetarian = newValue;
              });
            }),
            _buildSwitchListTile('Vegan', 'Only include vegan meals', _vegan,
                (newValue) {
              setState(() {
                _vegan = newValue;
              });
            })
          ],
        ))
      ]),
    );
  }
}
