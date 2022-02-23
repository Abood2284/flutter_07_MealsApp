import 'package:flutter/foundation.dart';

enum Complexity { Simple, Challenging, Hard }

enum Affordability { Affordable, Pricey, Luxurious }

class Meal {
  final String id; // To identify unique meals
  final List<String>
      categories; // Ofc a meal should be part of 1 or more category
  final String title; // Title of a meal
  final String imageUrl; // Fetching from internet
  final List<String>
      ingredients; // Every meal should have a list of ingredients
  final List<String> steps; // Describes what-to do inorder to make that meal
  final int
      duration; // We want to give user a assumption on how long will take to make that meal
  final Complexity complexity; // States easy hard
  final Affordability affordability;
  // These are used when we add settings or filtering in our app
  // on what filter what meal to show
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal(
      {required this.id,
      required this.categories,
      required this.title,
      required this.imageUrl,
      required this.ingredients,
      required this.steps,
      required this.duration,
      required this.complexity,
      required this.affordability,
      required this.isGlutenFree,
      required this.isLactoseFree,
      required this.isVegan,
      required this.isVegetarian});
}
