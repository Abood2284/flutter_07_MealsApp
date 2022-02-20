import 'package:flutter/material.dart';

import './categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: const Color.fromRGBO(255, 0, 47, 117),
          canvasColor: Colors.grey,
          fontFamily: 'Raleway',
          textTheme: ThemeData().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color:  Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: const TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
              )
              )),
      home: CategoriesScreen(),
    );
  }
}
