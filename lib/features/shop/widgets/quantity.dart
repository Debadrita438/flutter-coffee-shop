import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:coffee_shop/common_widgets/index.dart';
import 'package:coffee_shop/utils/colors.dart';
import 'package:coffee_shop/utils/icons.dart';

class QuantityCard extends StatelessWidget {
  const QuantityCard({super.key, required this.size});

  final String size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 35,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: HexColor(AppColor.deepestBlue),
          ),
          child: Center(
            child: MediumText(
              showText: size,
              fontSize: 18,
            ),
          ),
        ),
        RichText(
          text: TextSpan(
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
            children: [
              TextSpan(
                text: '\$',
                style: TextStyle(
                  color: HexColor(AppColor.orange),
                ),
              ),
              TextSpan(
                text: ' 4.20',
                style: TextStyle(
                  color: HexColor(AppColor.white),
                ),
              ),
            ],
          ),
        ),
        const AddRemove(addRemoveIcon: AppIcons.minusIcon),
        Container(
          height: 35,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: HexColor(AppColor.deepestBlue),
            border: Border.all(
              color: HexColor(AppColor.orange),
            ),
          ),
          child: const Center(
            child: SemiBoldText(
              showText: '1',
              fontSize: 16,
            ),
          ),
        ),
        const AddRemove(addRemoveIcon: AppIcons.plusIcon),
      ],
    );
  }
}
