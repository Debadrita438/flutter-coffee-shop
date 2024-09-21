import 'package:coffee_shop/features/landing/provider/beans_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:coffee_shop/features/singleDetails/widgets/size_button.dart';
import 'package:coffee_shop/common_widgets/index.dart';
import 'package:coffee_shop/features/landing/provider/coffee_provider.dart';
import 'package:coffee_shop/utils/colors.dart';

class DescriptionSize extends ConsumerWidget {
  const DescriptionSize({
    super.key,
    required this.type,
  });

  final String type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final singleItemDetails = type == 'coffee'
        ? ref.watch(coffeeProvider).singleCoffeeDetails
        : ref.watch(beansProvider).singleBeanDetails;

    final sizeList = singleItemDetails['size'].split(',');

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MediumText(
                showText: 'Description',
                fontSize: 16,
                textColor: AppColor.white,
              ),
              const SizedBox(height: 10),
              RegularText(
                showText: singleItemDetails['description'],
                fontSize: 12,
                textColor: AppColor.gray,
              ),
              const SizedBox(height: 10),
              const MediumText(
                showText: 'Size',
                fontSize: 16,
                textColor: AppColor.white,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizeButton(
                      buttonText: singleItemDetails['type'] == 'Coffee'
                          ? sizeList[0][0].toUpperCase()
                          : '${sizeList[0]} gm',
                      type: type),
                  SizeButton(
                      buttonText: singleItemDetails['type'] == 'Coffee'
                          ? sizeList[1][0].toUpperCase()
                          : '${sizeList[1]} gm',
                      type: type),
                  SizeButton(
                      buttonText: singleItemDetails['type'] == 'Coffee'
                          ? sizeList[2][0].toUpperCase()
                          : '${sizeList[2]} gm',
                      type: type),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
