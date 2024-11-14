import 'package:flutter/material.dart';
import 'package:mealapp/widget/meal_item.dart';

import '../models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
  });
  final String? title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return title == null
        ? containt(context)
        : Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(title!),
            ),
            body: containt(context),
          );
  }

  SingleChildScrollView containt(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: meals
            .map((meal) => MealItem(
                  meal: meal,
                ))
            .toList(),
      ),
    );
  }
}
