import 'package:flutter/material.dart';

import './screens/categories_screen.dart';
import './screens/category_recipe_screen.dart';
import './screens/meal_details_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
        '/': (ctx) => CategoriesScreen(),
        // PROBLEM
        //* In bigger apps if you make a typo error in passing the key properly you can get a
        // * error that will give a hard time catching it
        // SOLUTION
        // * so instead, you can store route name of that class
        // * in thier own class usin {static const} with doing that you can now acces this property without
        // * instantiating the class  'categoryRecipeScreen' => CategoryRecipeScreen.routeName
        CategoryRecipeScreen.routeName: (ctx) => CategoryRecipeScreen(),
        MealsDetailsScreen.routeName: (ctx) => MealsDetailsScreen(),
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
