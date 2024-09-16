import 'package:coffee_shop/common_widgets/index.dart';
import 'package:coffee_shop/utils/colors.dart';
import 'package:coffee_shop/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class RatingRoasted extends StatelessWidget {
  const RatingRoasted({
    super.key,
    required this.rating,
    required this.roasted,
  });

  final String rating;
  final String roasted;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 25,
                  height: 25,
                  child: SvgPicture.asset(
                    AppIcons.starIcon,
                    semanticsLabel: 'star',
                  ),
                ),
                const SizedBox(width: 5),
                SemiBoldText(
                  showText: rating,
                  fontSize: 14,
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.35,
            child: Container(
              width: 56,
              height: 45,
              decoration: BoxDecoration(
                color: HexColor(AppColor.darkBlue),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                border: Border.all(
                  color: HexColor(AppColor.transparentWhite),
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
              padding: const EdgeInsets.all(2),
              child: Center(
                child: MediumText(
                  showText: roasted,
                  fontSize: 10,
                  textColor: AppColor.gray,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
