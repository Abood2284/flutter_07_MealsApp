import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../screens/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
  });

  void selectedMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealsDetailsScreen.routeName, arguments: id);
  }

  Widget buildIconText() {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                const Icon(Icons.schedule),
                const SizedBox(width: 6),
                Text('$duration min')
              ],
            ),
            Row(
              children: <Widget>[
                const Icon(
                  Icons.work,
                ),
                const SizedBox(
                  width: 6,
                ),
                // * Extracting enum values to string, though you need to import foundatin.dart to use this
                Text(describeEnum(complexity)),
              ],
            ),
            Row(
              children: <Widget>[
                const Icon(
                  Icons.attach_money,
                ),
                const SizedBox(
                  width: 6,
                ),
                Text(describeEnum(affordability)),
              ],
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                // Forces it chlld to take the desired form, becuase flutter doesnt provide internal tool to crop image
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(imageUrl),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 270,
                    color: Colors.black54,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(title,
                        style: const TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade),
                  ),
                ),
              ],
            ),
            buildIconText(),
          ],
        ),
      ),
    );
  }
}
