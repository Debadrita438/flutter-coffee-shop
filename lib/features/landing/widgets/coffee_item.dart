import 'package:coffee_shop/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:coffee_shop/common_widgets/index.dart';
import 'package:coffee_shop/utils/colors.dart';

class CoffeeItemCard extends StatelessWidget {
  const CoffeeItemCard({
    super.key,
    required this.addRemoveIcon,
    required this.showRating,
    required this.type,
    required this.coffeeItem,
  });

  final String addRemoveIcon;
  final bool showRating;
  final String type;
  final Map<String, dynamic> coffeeItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: coffeeItem['id'],
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
                child: Image.network(
                  coffeeItem['image'],
                  fit: BoxFit.cover,
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
                            AppIcons.starIcon,
                            semanticsLabel: 'star',
                          ),
                        ),
                        SemiBoldText(
                          showText: coffeeItem['rating'],
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
            child: RegularText(
              showText: type == 'coffee'
                  ? coffeeItem['coffee-name']
                  : coffeeItem['beans-name'],
              fontSize: 16,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 5),
          if (type == 'coffee' && coffeeItem['add-milk'] == 'true')
            const SizedBox(
              width: double.infinity,
              child: RegularText(
                showText: 'With Steamed Milk',
                fontSize: 11,
              ),
            )
          else
            SizedBox(
              width: double.infinity,
              child: RegularText(
                showText: coffeeItem['roasted'],
                fontSize: 11,
              ),
            ),
          const SizedBox(height: 12),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      const SemiBoldText(
                        showText: '\$',
                        textColor: AppColor.orange,
                        fontSize: 20,
                      ),
                      const SizedBox(width: 5),
                      SemiBoldText(
                        showText: coffeeItem['price'],
                        fontSize: 20,
                      ),
                    ],
                  ),
                ),
                AddRemove(addRemoveIcon: addRemoveIcon),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
