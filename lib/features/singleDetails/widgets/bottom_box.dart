import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:coffee_shop/common_widgets/index.dart';
import 'package:coffee_shop/features/landing/provider/coffee_provider.dart';
import 'package:coffee_shop/utils/colors.dart';

class BottomBox extends ConsumerWidget {
  const BottomBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final singleItemDetails = ref.watch(coffeeProvider).singleCoffeeDetails;

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
                onTap: () {},
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
