// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import '../models/meal.dart';
import '../screens/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
  });
  final Meal meal;

  String get complexityText {
    switch (meal.complexity) {
      case Complexity.simple:
        return 'Simple';
        break;
      case Complexity.challenging:
        return 'Challenging';
        break;
      case Complexity.hard:
        return 'Hard';
        break;
    }
  }

  String get affordabilityTe {
    switch (meal.affordability) {
      case Affordability.affordable:
        return 'Affordable';
        break;
      case Affordability.luxurious:
        return 'Luxurious';
        break;
      case Affordability.pricey:
        return 'Pricey';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 12,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => MealDetailsScreen(
                    meal: meal,
                  ),
                ),
              );
            },
            child: Stack(
              children: [
                Hero(
                  tag: meal.id,
                  child: FadeInImage(
                    placeholder: MemoryImage(kTransparentImage),
                    image: NetworkImage(meal.imageUrl),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 44,
                      vertical: 6,
                    ),
                    color: Colors.black54,
                    child: Column(
                      children: [
                        Text(
                          meal.title,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  const Icon(Icons.schedule),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "${meal.duration} min",
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ]),
                Row(children: [
                  const Icon(Icons.work),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    complexityText,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ]),
                Row(children: [
                  const Icon(Icons.attach_money),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    affordabilityTe,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
