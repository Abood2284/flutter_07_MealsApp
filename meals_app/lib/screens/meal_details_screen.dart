import 'package:flutter/material.dart';

import '../data/dummy_data.dart';

class MealsDetailsScreen extends StatelessWidget {
  static const routeName = 'meal-details-page';

  final Function toggleFavorite;
  final Function isFavorite;

  MealsDetailsScreen(this.toggleFavorite, this.isFavorite);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Text(text, style: Theme.of(context).textTheme.headline6)),
    );
  }

  Widget buildCommonWidget(BuildContext context, {required Widget child}) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.cyanAccent)),
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.height * 0.45,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    // * WE already have the mealId we passed throught route now we can fetch data from the id we got
    // * firstWhere : Returns the first element that satisfies the given predicate [test].
    // * now our variable selectedMeal stores object of type Meal where id is met (Hover for more)
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => mealId == meal.id);
    return Scaffold(
        appBar: AppBar(
          title: Text(selectedMeal.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(4),
                width: double.infinity,
                child: Card(
                  shadowColor: Colors.grey,
                  elevation: 18,
                  shape: const CircleBorder(),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: Image.network(selectedMeal.imageUrl),
                  ),
                ),
              ),
              buildSectionTitle(context, 'Ingredients'),
              buildCommonWidget(
                context,
                child: ListView.builder(
                    itemCount: selectedMeal.ingredients.length,
                    itemBuilder: (ctx, index) => Card(
                          elevation: 3,
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 7, horizontal: 15),
                              child: Text(selectedMeal.ingredients[index])),
                          color: Colors.amber,
                        )),
              ),
              buildSectionTitle(context, 'Steps'),
              buildCommonWidget(
                context,
                child: ListView.separated(
                  itemCount: selectedMeal.steps.length,
                  separatorBuilder: (ctx, index) => const Divider(),
                  itemBuilder: (ctx, index) => ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${(index + 1)}'),
                    ),
                    title: Text(
                      selectedMeal.steps[index],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.add_moderator_rounded),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Enjoy your healty meal')
                ],
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(mealId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => toggleFavorite(mealId),
      ),
    );
  }
}
