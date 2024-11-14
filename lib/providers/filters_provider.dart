import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'meals_provider.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegan,
  vegeterian,
}

class FiltersNotifre extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifre()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegan: false,
          Filter.vegeterian: false,
        });
  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }

  void setFilters(Map<Filter, bool> chodenFilters) {
    state = chodenFilters;
  }
}

final filtersNotifreProvider =
    StateNotifierProvider<FiltersNotifre, Map<Filter, bool>>(
        (ref) => FiltersNotifre());

final filtredMealsProvider = Provider((ref) {
  final meal = ref.watch(mealsProvider);
  final Map<Filter, bool> activeFilters = ref.watch(filtersNotifreProvider);

  return meal.where((meal) {
    if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filter.vegeterian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
