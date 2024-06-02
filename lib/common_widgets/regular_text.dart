import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:coffee_shop/utils/colors.dart';

class RegularText extends StatelessWidget {
  const RegularText({
    super.key,
    required this.showText,
    this.textColor = AppColor.white,
    this.fontSize = 14,
    this.maxLines,
    this.overflow,
  });

  final String showText;
  final String textColor;
  final double fontSize;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      showText,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
        color: HexColor(textColor),
        fontSize: fontSize,
      ),
      maxLines: maxLines ?? maxLines,
      overflow: overflow ?? overflow,
    );
  }
}
