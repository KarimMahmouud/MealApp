import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../models/meal.dart';
import '../widget/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    super.key,
    required this.avilableMeals,
  });

  final List<Meal> avilableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      lowerBound: 0,
      upperBound: 1,
    );
    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 2 / 2,
        ),
        children: [
          for (final index in availableCategories)
            CatrgotyGridItem(
              category: index,
              avilableMeals: widget.avilableMeals,
            ),
        ],
      ),
      builder: (ctx, child) => Padding(
        padding: EdgeInsets.only(top: 140 - controller.value * 140),
        child: child,
      ),
    );
  }
}
