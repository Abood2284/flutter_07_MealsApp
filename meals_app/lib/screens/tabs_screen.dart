import 'package:flutter/material.dart';

import './favorites_screen.dart';
import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  // * Creating map so that we can dynamically use title key for that screen
  final List<Map<String, Object>> _pages = [
    {
      'page': CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'page': FavoritesScreen(),
      'title': 'Your Favorite',
    },
  ];
  // * Will hold the index of the currrent screen
  int _selectedPageIndex = 0;

// * Flutter will pass the index you dont need to pass it
// * this index referes to the screen by default your page will be
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
        ),
        //For Having a bottom of scalfold tabs
        bottomNavigationBar: TabBar(
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.category),
              text: 'Categories',
            ),
            Tab(
              icon: Icon(Icons.favorite),
              text: 'Favorites',
            )
          ],
        ),
        body: TabBarView(
            children: <Widget>[CategoriesScreen(), FavoritesScreen()]),
      ),
    );
  }
}
