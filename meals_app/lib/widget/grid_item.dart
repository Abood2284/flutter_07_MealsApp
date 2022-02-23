import 'package:flutter/material.dart';
import '../screens/category_recipe_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  void _pushRecipeScreen(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryRecipeScreen.routeName, arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _pushRecipeScreen(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
          padding: const EdgeInsets.all(15),
          child: Text(title, style: Theme.of(context).textTheme.headline6,),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
              gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ))),
    );
  }
}
