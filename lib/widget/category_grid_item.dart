import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import '../screens/meals_screen.dart';
import '../models/category.dart';

class CatrgotyGridItem extends StatelessWidget {
  const CatrgotyGridItem({
    super.key,
    required this.category,
    required this.avilableMeals,
  });

  final Category category;
  final List<Meal> avilableMeals;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // GestureDetector بديل ليها
      onTap: () {
        final List<Meal> filterdMeal = avilableMeals
            .where(
              (meal) => meal.categories.contains(category.id),
            )
            .toList();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => MealsScreen(
                  title: category.title,
                  meals: filterdMeal,
                )),
          ),
        );
      },
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(
          16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.54),
              category.color.withOpacity(0.90),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
