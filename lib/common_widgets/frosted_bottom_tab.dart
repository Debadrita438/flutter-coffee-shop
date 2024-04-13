import 'dart:ui';

import 'package:coffee_shop/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class FrostedBottomTab extends StatelessWidget {
  const FrostedBottomTab({super.key});

  final String _homeIcon = 'assets/icons/home.svg';
  final String _shopIcon = 'assets/icons/shopping.svg';
  final String _heartIcon = 'assets/icons/heart.svg';
  final String _notificationIcon = 'assets/icons/notification.svg';

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        height: 70,
        color: Colors.transparent,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.15),
                    Colors.white.withOpacity(0.05),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 1,
              width: MediaQuery.of(context).size.width * 1,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    _homeIcon,
                    semanticsLabel: 'home icon',
                    colorFilter: ColorFilter.mode(
                      HexColor(AppColor.lightGray2),
                      BlendMode.srcIn,
                    ),
                  ),
                  SvgPicture.asset(
                    _shopIcon,
                    semanticsLabel: 'shop icon',
                  ),
                  SvgPicture.asset(
                    _heartIcon,
                    semanticsLabel: 'heart icon',
                  ),
                  SvgPicture.asset(
                    _notificationIcon,
                    semanticsLabel: 'notification icon',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
