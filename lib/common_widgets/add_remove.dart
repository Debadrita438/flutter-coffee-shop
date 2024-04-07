import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:coffee_shop/utils/colors.dart';

class AddRemove extends StatelessWidget {
  const AddRemove({super.key, required this.addRemoveIcon});

  final String addRemoveIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 35,
        width: 35,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: HexColor(AppColor.orange),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: SvgPicture.asset(
          addRemoveIcon,
          semanticsLabel: 'My SVG Image',
        ),
      ),
    );
  }
}
