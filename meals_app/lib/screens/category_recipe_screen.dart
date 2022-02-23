import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../widget/meal_item.dart';

class CategoryRecipeScreen extends StatelessWidget {
  static const routeName = 'categoryRecipeScreen';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categorizedMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(
          categoryId); // * categories is a list and dart allow .contains method on a list
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle!),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: categorizedMeals[index].id,
              title: categorizedMeals[index].title,
              imageUrl: categorizedMeals[index].imageUrl,
              duration: categorizedMeals[index].duration,
              affordability: categorizedMeals[index].affordability,
              complexity: categorizedMeals[index].complexity,
            );
          },
          itemCount: categorizedMeals.length,
        ));
  }
}
