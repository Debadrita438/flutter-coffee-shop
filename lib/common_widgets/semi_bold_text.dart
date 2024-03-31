import 'package:coffee_shop/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SemiBoldText extends StatelessWidget {
  const SemiBoldText({
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
        fontWeight: FontWeight.w600,
        color: HexColor(textColor),
        fontSize: fontSize,
      ),
    );
  }
}
