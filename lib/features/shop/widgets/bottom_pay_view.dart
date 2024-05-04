import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:coffee_shop/common_widgets/index.dart';
import 'package:coffee_shop/utils/colors.dart';

class BottomPayView extends StatelessWidget {
  const BottomPayView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        bottom: 60,
        top: 15,
        right: 10,
        left: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const MediumText(
                showText: 'Total Price',
                fontSize: 11,
                textColor: AppColor.gray,
              ),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 20,
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
            ],
          ),
          CustomOrangeButton(
            buttonBorderRadius: 20,
            buttonHeight: MediaQuery.of(context).size.height * 0.08,
            buttonWidth: MediaQuery.of(context).size.width * 0.6,
            buttonLabel: 'Pay',
            labelSize: 16,
            onPress: () {},
          ),
        ],
      ),
    );
  }
}
