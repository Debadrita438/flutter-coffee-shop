import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:coffee_shop/common_widgets/index.dart';
import 'package:coffee_shop/utils/icons.dart';
import 'package:coffee_shop/utils/colors.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({
    super.key,
    this.displayHeaderText = false,
    this.headerText = '',
  });

  final bool displayHeaderText;
  final String headerText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: HexColor(AppColor.grayishBlack),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  color: HexColor(AppColor.transparentWhite),
                  width: 1,
                  style: BorderStyle.solid,
                ),
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(94, 128, 128, 128),
                    Color.fromARGB(0, 0, 0, 0)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              padding: const EdgeInsets.all(10),
              child: SvgPicture.asset(
                AppIcons.menuIcon,
                semanticsLabel: 'My SVG Image',
                colorFilter: ColorFilter.mode(
                  HexColor(AppColor.lightGray),
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          if (displayHeaderText)
            SemiBoldText(
              showText: headerText,
              fontSize: 20,
            ),
          InkWell(
            onTap: () {},
            child: Container(
              width: 35,
              height: 35,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: HexColor(AppColor.grayishBlack),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(94, 128, 128, 128),
                    Color.fromARGB(0, 0, 0, 0)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Image.asset(
                AppIcons.defaultUserIcon,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
