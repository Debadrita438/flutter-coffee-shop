import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:coffee_shop/features/singleDetails/widgets/name_location_info.dart';
import 'package:coffee_shop/features/singleDetails/widgets/rating_roasted.dart';
import 'package:coffee_shop/features/landing/provider/coffee_provider.dart';
import 'package:coffee_shop/features/singleDetails/widgets/details_header.dart';
import 'package:coffee_shop/utils/colors.dart';
import 'package:coffee_shop/utils/icons.dart';

class ImageInfoComponent extends ConsumerWidget {
  const ImageInfoComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final singleItemDetails = ref.watch(coffeeProvider).singleCoffeeDetails;

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.network(
              singleItemDetails['image'],
              fit: BoxFit.cover,
            ),
          ),
          // header
          Positioned(
            top: MediaQuery.of(context).size.height * 0.05,
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: const DetailsHeader(),
            ),
          ),
          // transparent bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              padding: const EdgeInsetsDirectional.all(15),
              decoration: BoxDecoration(
                color: HexColor(AppColor.blackOp5),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  NameLocationInfo(
                    coffeeName: singleItemDetails['coffee-name'],
                    location: singleItemDetails['location'],
                    icon: singleItemDetails['type'] == 'Coffee'
                        ? AppIcons.coffeeIcon
                        : AppIcons.beanIcon,
                    type: singleItemDetails['type'],
                  ),
                  // Rating and medium rosated.
                  RatingRoasted(
                    rating: singleItemDetails['rating'],
                    roasted: singleItemDetails['roasted'],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
