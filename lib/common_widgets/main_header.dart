import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:coffee_shop/utils/colors.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({super.key});

  final String menuIcon = "assets/icons/menu.svg";
  final String defaultUserIcon = 'assets/images/defaultUser.jpg';

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
              menuIcon,
              semanticsLabel: 'My SVG Image',
              colorFilter: const ColorFilter.mode(
                Color.fromRGBO(255, 255, 255, 0.18),
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
              defaultUserIcon,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
