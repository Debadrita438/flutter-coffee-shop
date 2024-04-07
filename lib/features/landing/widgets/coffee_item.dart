import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:coffee_shop/common_widgets/index.dart';
import 'package:coffee_shop/utils/colors.dart';

class CoffeeItemCard extends StatelessWidget {
  const CoffeeItemCard({
    super.key,
    required this.addRemoveIcon,
    required this.showRating,
    required this.coffeeImage,
  });

  final String addRemoveIcon;
  final bool showRating;
  final String coffeeImage;

  final String _starIcon = 'assets/icons/star.svg';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 15,
      ),
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: HexColor(AppColor.grayishBlack),
        borderRadius: BorderRadius.circular(23),
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(94, 128, 128, 128),
            Color.fromARGB(0, 0, 0, 0)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                height: 150,
                width: 150,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.asset(
                  coffeeImage,
                  fit: BoxFit.fill,
                ),
              ),
              if (showRating)
                Positioned(
                  right: 0,
                  height: 28,
                  width: 70,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16),
                        bottomLeft: Radius.circular(23),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 15,
                          height: 15,
                          child: SvgPicture.asset(
                            _starIcon,
                            semanticsLabel: 'star',
                          ),
                        ),
                        const SemiBoldText(
                          showText: '4.2',
                          fontSize: 14,
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 10),
            child: const RegularText(
              showText: 'Cappuccino',
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 5),
          const SizedBox(
            width: double.infinity,
            child: RegularText(
              showText: 'With Steamed Milk',
              fontSize: 11,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                child: Row(
                  children: [
                    SemiBoldText(
                      showText: '\$',
                      textColor: AppColor.orange,
                      fontSize: 20,
                    ),
                    SizedBox(width: 5),
                    SemiBoldText(
                      showText: '4.20',
                      fontSize: 20,
                    ),
                  ],
                ),
              ),
              AddRemove(addRemoveIcon: addRemoveIcon),
            ],
          ),
        ],
      ),
    );
  }
}
