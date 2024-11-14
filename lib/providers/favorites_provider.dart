import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal.dart';

class FavoriteMealProviderNotifre extends StateNotifier<List<Meal>> {
  FavoriteMealProviderNotifre() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    
    final isExisting = state.contains(meal);
    if (isExisting) {
      // state.remove(meal); ==>
      state = state.where((element) => element.id != meal.id).toList();
      return false;
    } else {
      // state.add(meal);==>
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealProvider =
    StateNotifierProvider<FavoriteMealProviderNotifre, List<Meal>>((ref) {
  return FavoriteMealProviderNotifre();
});
