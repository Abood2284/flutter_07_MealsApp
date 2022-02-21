import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../repositories/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Meal'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          // * If deivce widith is 300 only 1 child wil be there in col, if device width 500 then 2
          maxCrossAxisExtent: 200,
          // * Define how items shoule be sized based on there height & width
          childAspectRatio: 3 / 2,
          //* Spacing in col & row between each child
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES
            .map((catData) => CategoryItem(catData.id, catData.title, catData.color))
            .toList(),
      ),
    );
  }
}
