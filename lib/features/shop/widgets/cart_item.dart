import 'package:coffee_shop/features/shop/widgets/quantity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:coffee_shop/common_widgets/index.dart';
import 'package:coffee_shop/utils/colors.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: HexColor(AppColor.grayishBlack),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(100, 255, 255, 255),
            Color.fromARGB(1, 12, 15, 20),
          ],
          transform: GradientRotation(1.5),
          begin: Alignment(-1.5, 1.5),
          end: Alignment(0.9, 0.5),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 100,
                width: 100,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.asset('assets/images/coffee.png'),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MediumText(showText: 'Cappuccino', fontSize: 18),
                    const SizedBox(height: 2),
                    const RegularText(
                      showText: 'With Steamed Milk',
                      fontSize: 12,
                    ),
                    Container(
                      height: 48,
                      width: 118,
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: HexColor(AppColor.deepestBlue),
                      ),
                      child: const Center(
                        child: MediumText(
                          showText: 'Medium Roasted',
                          fontSize: 11,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 15),
          const QuantityCard(size: 'S'),
          const SizedBox(height: 10),
          const QuantityCard(size: 'M'),
          const SizedBox(height: 10),
          const QuantityCard(size: 'L'),
        ],
      ),
    );
  }
}
