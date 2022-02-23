import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/meal.dart';

class IconTextMealItem extends StatelessWidget {
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const IconTextMealItem({
    Key? key,
    required this.duration,
    required this.complexity,
    required this.affordability,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            Row(children: <Widget>[
                    const Icon(Icons.work,),
                    const SizedBox(width: 6,),
                    // * Extracting enum values to string, though you need to import foundatin.dart to use this 
                    Text(describeEnum(complexity)),
                  ],),
                    Row(children: <Widget>[
                    const Icon(Icons.attach_money,),
                    const SizedBox(width: 6,),
                    Text(describeEnum(affordability)),
                  ],),
          ],
        ));
  }
}
