import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:coffee_shop/common_widgets/index.dart';
import 'package:coffee_shop/features/landing/provider/beans_provider.dart';
import 'package:coffee_shop/features/landing/provider/coffee_provider.dart';
import 'package:coffee_shop/features/landing/widgets/coffee_item.dart';
import 'package:coffee_shop/utils/icons.dart';

class CoffeeBeansList extends ConsumerWidget {
  const CoffeeBeansList({
    super.key,
    required this.type,
    this.searchText = '',
  });

  final String type;
  final String searchText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (type == 'coffee') {
      return FutureBuilder(
        future: ref.read(coffeeProvider.notifier).fetchCoffeeList(),
        builder: (context, coffeeSnapshot) {
          if (coffeeSnapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: const CustomLoading(),
            );
          }

          var allCoffeeList = [];

          if (searchText.isNotEmpty) {
            allCoffeeList = ref
                .read(coffeeProvider)
                .coffeeList
                .where((coffee) => coffee['coffee-name'].contains(searchText))
                .toList();
          } else {
            allCoffeeList = ref.read(coffeeProvider).coffeeList;
          }

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
                  type: 'coffee',
                );
              },
            ),
          );
        },
      );
    } else {
      return FutureBuilder(
        future: ref.read(beansProvider.notifier).fetchBeansList(),
        builder: (context, beansSnapshot) {
          if (beansSnapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: const CustomLoading(),
            );
          }

          var allCoffeeList = ref.read(beansProvider).beansList;

          return SizedBox(
            height: MediaQuery.of(context).size.width * 0.73,
            child: ListView.builder(
              itemCount: allCoffeeList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CoffeeItemCard(
                  coffeeItem: allCoffeeList[index],
                  addRemoveIcon: AppIcons.plusIcon,
                  showRating: false,
                  type: 'beans',
                );
              },
            ),
          );
        },
      );
    }
  }
}
