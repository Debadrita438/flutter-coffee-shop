import 'package:coffee_shop/features/landing/provider/beans_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:coffee_shop/common_widgets/index.dart';
import 'package:coffee_shop/features/landing/provider/coffee_provider.dart';
import 'package:coffee_shop/utils/colors.dart';

class BottomBox extends ConsumerWidget {
  const BottomBox({
    super.key,
    required this.type,
  });

  final String type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final singleItemDetails = type == 'coffee'
        ? ref.watch(coffeeProvider).singleCoffeeDetails
        : ref.watch(beansProvider).singleBeanDetails;
    String storedSize = ref.watch(coffeeProvider).size;

    void addToCart() {
      Map<String, dynamic> storeCoffee = {
        'itemId': singleItemDetails['_id'],
        'name': singleItemDetails['coffee-name'],
        'image': singleItemDetails['image'],
        'roasted': singleItemDetails['roasted'],
        'add-milk': singleItemDetails['add-milk'],
        'price': singleItemDetails['price'],
        'size': [storedSize],
        'quantity': 1,
      };
      ref.read(coffeeProvider.notifier).addToCartCoffee(storeCoffee);
    }

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
          top: 10,
          bottom: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const RegularText(
                    showText: 'Price',
                    fontSize: 12,
                  ),
                  Row(
                    children: [
                      const SemiBoldText(
                        showText: '\$',
                        textColor: AppColor.orange,
                        fontSize: 20,
                      ),
                      const SizedBox(width: 5),
                      SemiBoldText(
                        showText: singleItemDetails['price'],
                        fontSize: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              child: InkWell(
                onTap: addToCart,
                child: Container(
                  height: 50,
                  width: 200,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: HexColor(AppColor.orange),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: const Center(
                    child: SemiBoldText(
                      showText: 'Add to Cart',
                      fontSize: 16,
                      textColor: AppColor.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
