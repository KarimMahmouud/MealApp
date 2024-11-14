import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/filters_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersNotifreProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilters[Filter.glutenFree]!,
            onChanged: (bool value) {
              ref
                  .read(filtersNotifreProvider.notifier)
                  .setFilter(Filter.glutenFree, value);
              // setState(() {
              //   glutenFreeFilter = value;
              // });
            },
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(
              left: 35,
              right: 22,
            ),
            title: Text(
              "Gluten-free",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              "Only include gluten-free meals.",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ),
          SwitchListTile(
            value: activeFilters[Filter.lactoseFree]!,
            onChanged: (bool value) {
              ref
                  .read(filtersNotifreProvider.notifier)
                  .setFilter(Filter.lactoseFree, value);
              // setState(() {
              //   lactoseFreeFilter = value;
              // });
            },
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(
              left: 35,
              right: 22,
            ),
            title: Text(
              "Lactose-free",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              "Only include Lactose-free meals.",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegeterian]!,
            onChanged: (bool value) {
              ref
                  .read(filtersNotifreProvider.notifier)
                  .setFilter(Filter.vegeterian, value);
              // setState(() {
              //   vegetarianFreeFilter = value;
              // });
            },
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(
              left: 35,
              right: 22,
            ),
            title: Text(
              "Vegetarian",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              "Only include Vegetarian meals.",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegan]!,
            onChanged: (bool value) {
              ref
                  .read(filtersNotifreProvider.notifier)
                  .setFilter(Filter.vegan, value);
              // setState(() {
              //   veganFreeFilter = value;
              // });
            },
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(
              left: 35,
              right: 22,
            ),
            title: Text(
              "Vegan",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              "Only include vegan meals.",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
