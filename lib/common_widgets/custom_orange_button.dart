import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:coffee_shop/common_widgets/index.dart';
import 'package:coffee_shop/utils/colors.dart';

class CustomOrangeButton extends StatelessWidget {
  const CustomOrangeButton({
    super.key,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.buttonBorderRadius,
    required this.buttonLabel,
    required this.labelSize,
    required this.onPress,
  });

  final double buttonWidth;
  final double buttonHeight;
  final double buttonBorderRadius;
  final String buttonLabel;
  final double labelSize;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: buttonWidth,
        height: buttonHeight,
        decoration: BoxDecoration(
          color: HexColor(AppColor.orange),
          borderRadius: BorderRadius.circular(buttonBorderRadius),
        ),
        child: Center(
          child: SemiBoldText(
            showText: buttonLabel,
            fontSize: labelSize,
          ),
        ),
      ),
    );
  }
}
