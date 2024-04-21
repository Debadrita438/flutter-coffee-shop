import 'dart:ui';

import 'package:coffee_shop/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class FrostedBottomTab extends StatefulWidget {
  const FrostedBottomTab({super.key, required this.onNavigate});

  final void Function(int index) onNavigate;

  @override
  State<FrostedBottomTab> createState() => _FrostedBottomTabState();
}

class _FrostedBottomTabState extends State<FrostedBottomTab> {
  final String _homeIcon = 'assets/icons/home.svg';
  final String _shopIcon = 'assets/icons/shopping.svg';
  final String _heartIcon = 'assets/icons/heart.svg';
  final String _notificationIcon = 'assets/icons/notification.svg';

  int selectItem = 1;

  ColorFilter displayColor(int index) {
    return index == selectItem
        ? ColorFilter.mode(
            HexColor(AppColor.orange),
            BlendMode.srcIn,
          )
        : ColorFilter.mode(
            HexColor(AppColor.white),
            BlendMode.srcIn,
          );
  }

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
                borderRadius: BorderRadius.circular(35),
                border: Border.all(color: Colors.white.withOpacity(0.13)),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 1,
              width: MediaQuery.of(context).size.width * 1,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectItem = 1;
                      });
                      widget.onNavigate(1);
                    },
                    child: SvgPicture.asset(
                      _homeIcon,
                      semanticsLabel: 'home icon',
                      colorFilter: displayColor(1),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectItem = 2;
                      });
                      widget.onNavigate(2);
                    },
                    child: SvgPicture.asset(
                      _shopIcon,
                      semanticsLabel: 'shop icon',
                      colorFilter: displayColor(2),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectItem = 3;
                      });
                      widget.onNavigate(3);
                    },
                    child: SvgPicture.asset(
                      _heartIcon,
                      semanticsLabel: 'heart icon',
                      colorFilter: displayColor(3),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectItem = 4;
                      });
                      widget.onNavigate(4);
                    },
                    child: SvgPicture.asset(
                      _notificationIcon,
                      semanticsLabel: 'notification icon',
                      colorFilter: displayColor(4),
                    ),
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
