import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealapp/screens/filter_screen.dart';
import 'package:mealapp/screens/meals_screen.dart';
import '../models/meal.dart';
import '../providers/favorites_provider.dart';
import '../providers/filters_provider.dart';
import '../providers/nav_bar_provider.dart';
import '../widget/main_drawer.dart';
import 'categories_screen.dart';

class TabsScreen extends ConsumerWidget {
  const TabsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avilableMeals = ref.watch(filtredMealsProvider);
    final select = ref.read(navBarProviders.notifier).selectPage;
    final List<Meal> favMeal = ref.watch(favoriteMealProvider);
    final selectedPageIndex = ref.watch(navBarProviders);

    Widget activePage = CategoriesScreen(
      avilableMeals: avilableMeals,
    );

    var activePageTitle = 'Pic your category';

    if (selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: favMeal,
      );
      activePageTitle = 'Favorites';
    }

    void setScreen(String ididentifier) {
      Navigator.of(context).pop();
      if (ididentifier == "filters") {
        Navigator.push(
            context, MaterialPageRoute(builder: (ctx) => const FilterScreen()));
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: select,
        currentIndex: selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.set_meal,
            ),
            label: "Categorys",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
            ),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}
