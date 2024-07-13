import 'package:coffee_shop/utils/colors.dart';
import 'package:coffee_shop/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class DetailsHeader extends StatelessWidget {
  const DetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
            ),
            padding: const EdgeInsets.all(5),
            child: SvgPicture.asset(
              AppIcons.backIcon,
              semanticsLabel: 'My SVG Image',
              colorFilter: ColorFilter.mode(
                HexColor(AppColor.lightGray),
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
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
            ),
            padding: const EdgeInsets.all(6),
            child: SvgPicture.asset(
              AppIcons.heartIcon,
              semanticsLabel: 'My SVG Image',
              colorFilter: ColorFilter.mode(
                HexColor(AppColor.red),
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
