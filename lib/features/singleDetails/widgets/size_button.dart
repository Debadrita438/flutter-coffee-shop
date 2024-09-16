import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:coffee_shop/common_widgets/index.dart';
import 'package:coffee_shop/utils/colors.dart';

class SizeButton extends StatelessWidget {
  const SizeButton({super.key, required this.buttonText});

  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.height * 0.12,
        height: MediaQuery.of(context).size.height * 0.05,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: HexColor(AppColor.darkBlue),
            border: Border.all(
              color: HexColor(AppColor.orange),
              width: 2,
            )),
        child: Center(
          child: SemiBoldText(
            showText: buttonText,
            fontSize: 12,
            textColor: AppColor.orange,
          ),
        ),
      ),
    );
  }
}
