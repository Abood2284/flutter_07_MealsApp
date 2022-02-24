import 'package:flutter/material.dart';

import './screens/tabs_screen.dart';
import './screens/category_recipe_screen.dart';
import './screens/meal_details_screen.dart';
import 'screens/filltered_screen.dart';
import './data/dummy_data.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: const Color.fromRGBO(255, 0, 47, 117),
          canvasColor: Colors.grey[200], // * bg color of our app
          fontFamily: 'Raleway',
          textTheme: ThemeData().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: const TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
              ))),
      // * by default '/' is also flutter's main screen so you can also instantiate your main screen
      // * in routes section by using the '/' as key
      // home: CategoriesScreen(),
      // initialRoute: '/', // default = '/'
      // * Routes to our app arug & non-arguments
      routes: {
        '/': (ctx) => TabsScreen(_favoriteMeals),
        // PROBLEM
        //* In bigger apps if you make a typo error in passing the key properly you can get a
        // * error that will give a hard time catching it
        // SOLUTION
        // * so instead, you can store route name of that class
        // * in thier own class usin {static const} with doing that you can now acces this property without
        // * instantiating the class  'categoryRecipeScreen' => CategoryRecipeScreen.routeName
        CategoryRecipeScreen.routeName: (ctx) => CategoryRecipeScreen(_favoriteMeals),
        MealsDetailsScreen.routeName: (ctx) => MealsDetailsScreen(_toggleFavorite, _isMealFavorite),
        FillteredScreen.routeName: (ctx) => FillteredScreen(_filters, _setFilters),
      },

      /// * onGenerateRoute is called if you dont specify the namedRoute in your main dart
      /// * and yet still you try to navigate so instead of throwing an error flutter
      /// * will run onGenerateRoute and will return the route you specified here
      ///
      /// * Also it gives us a settings which hold metadata about route we can use
      /// * .name to check if name matches any of our route so return this or else that
      // onGenerateRoute: (settings) {
      //   if(settings.name == 'MealsDetailsScreen.routeName')
      //   {
      //   return MaterialPageRoute(builder: (ctx) => CategoryRecipeScreen(),);
      //   }else{
      //     return 'some other screen';
      //   }
      // },
      /// * onUnknownRoute is the last backup flutter will check before throwing an error
      /// * if you dont specify any route in your route section and also no route in your onGenerateRoute
      /// * then this will be your last option to save your app from error
      ///
      /// * Though this is also used as your 404 page, you can create such a page so  that if you forget to add a route
      /// * instead of getting an error flutter shows user a 404 page which says hey this page is under development
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(
      //     builder: (ctx) => CategoryRecipeScreen(),
      //   );
      // },
    );
  }
}
