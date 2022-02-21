import 'package:flutter/material.dart';

class CategoryRecipeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final String? categoryTitle = routeArgs['title'];
    final String? id = routeArgs['id'];
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: const Center(
        child: Text('This is the recipe of your meal'),
      ),
    );
  }
}
