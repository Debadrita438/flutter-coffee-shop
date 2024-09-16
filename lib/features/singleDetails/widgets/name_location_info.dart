import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:coffee_shop/common_widgets/index.dart';
import 'package:coffee_shop/utils/colors.dart';
import 'package:coffee_shop/utils/icons.dart';

class NameLocationInfo extends StatelessWidget {
  const NameLocationInfo({
    super.key,
    required this.coffeeName,
    required this.location,
    required this.icon,
    required this.type,
  });

  final String coffeeName;
  final String location;
  final String icon;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SemiBoldText(
                  showText: coffeeName,
                  fontSize: 20,
                ),
                RegularText(
                  showText: 'From $location',
                  fontSize: 16,
                  textColor: AppColor.gray,
                )
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 56,
                  height: 56,
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
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        icon,
                        semanticsLabel: 'My SVG Image',
                      ),
                      MediumText(
                        showText: type,
                        fontSize: 10,
                        textColor: AppColor.gray,
                      )
                    ],
                  ),
                ),
                Container(
                  width: 56,
                  height: 56,
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
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        AppIcons.locationIcon,
                        semanticsLabel: 'My SVG Image',
                      ),
                      MediumText(
                        showText: location,
                        fontSize: 10,
                        textColor: AppColor.gray,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
