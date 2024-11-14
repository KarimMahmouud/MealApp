import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal.dart';
import '../providers/favorites_provider.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritMeals = ref.watch(favoriteMealProvider);
    final bool isActive = favoritMeals.contains(meal);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              final add = ref
                  .read(favoriteMealProvider.notifier)
                  .toggleMealFavoriteStatus(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(add
                      ? 'Marekd as a favorite'
                      : 'Meal is a longer a favorite'),
                ),
              );
            },
            icon: AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: Tween<double>(begin: 0.5, end: 1).animate(animation),
                  child: child,
                );
              },
              // ignore: sort_child_properties_last
              child: Icon(isActive ? Icons.star : Icons.star_border,
                  color: Colors.amber),
              key: ValueKey(isActive),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: meal.id,
              child: Image.network(meal.imageUrl),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Ingredients",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 197, 119, 119),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            for (final ingr in meal.ingredients)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text(
                  ingr,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            const SizedBox(
              height: 22,
            ),
            const Text(
              "Steps",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 197, 119, 119),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            for (final steps in meal.ingredients)
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Text(
                  steps,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
