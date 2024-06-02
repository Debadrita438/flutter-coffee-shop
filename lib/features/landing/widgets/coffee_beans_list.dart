import 'package:coffee_shop/features/landing/provider/coffee_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:coffee_shop/features/landing/widgets/coffee_item.dart';
import 'package:coffee_shop/utils/icons.dart';

class CoffeeBeansList extends ConsumerWidget {
  const CoffeeBeansList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: ref.read(coffeeProvider.notifier).fetchCoffeeList(),
      builder: (context, coffeeSnapshot) {
        if (coffeeSnapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading...');
        }

        var allCoffeeList = ref.read(coffeeProvider).coffeeList;

        return SizedBox(
          height: MediaQuery.of(context).size.width * 0.73,
          child: ListView.builder(
            itemCount: allCoffeeList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CoffeeItemCard(
                coffeeItem: allCoffeeList[index],
                addRemoveIcon: AppIcons.plusIcon,
                showRating: true,
                coffeeImage: 'assets/images/coffee.png',
              );
            },
          ),
        );
      },
    );
  }
}