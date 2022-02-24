import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../widget/meal_item.dart';
import '../models/meal.dart';

class CategoryRecipeScreen extends StatefulWidget {
  static const routeName = 'categoryRecipeScreen';

  final List<Meal> availableMeals;

  CategoryRecipeScreen(this.availableMeals);

  @override
  State<CategoryRecipeScreen> createState() => _CategoryRecipeScreenState();
}

class _CategoryRecipeScreenState extends State<CategoryRecipeScreen> {
  late String categoryTitle;
  late List<Meal> displayedMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    // ...
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'] as String;
      final categoryId = routeArgs['id'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }
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
