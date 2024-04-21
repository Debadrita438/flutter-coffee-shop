import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:coffee_shop/utils/colors.dart';

class MediumText extends StatelessWidget {
  const MediumText({
    super.key,
    required this.showText,
    this.textColor = AppColor.white,
    this.fontSize = 14,
  });

  final String showText;
  final String textColor;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      showText,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        color: HexColor(textColor),
        fontSize: fontSize,
      ),
    );
  }
}
