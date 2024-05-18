import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class FrostedBottomTab extends StatelessWidget {
  const FrostedBottomTab({
    super.key,
    required this.onPress,
    required this.onChangeColor,
  });

  final void Function(int index) onPress;
  final String Function(int index) onChangeColor;

  final String _homeIcon = 'assets/icons/home.svg';
  final String _shopIcon = 'assets/icons/shopping.svg';
  final String _heartIcon = 'assets/icons/heart.svg';
  final String _notificationIcon = 'assets/icons/notification.svg';

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(35),
        ),
        clipBehavior: Clip.hardEdge,
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
                    onTap: () => onPress(1),
                    child: SvgPicture.asset(
                      _homeIcon,
                      semanticsLabel: 'home icon',
                      colorFilter: ColorFilter.mode(
                        HexColor(onChangeColor(1)),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => onPress(2),
                    child: SvgPicture.asset(
                      _shopIcon,
                      semanticsLabel: 'shop icon',
                      colorFilter: ColorFilter.mode(
                        HexColor(onChangeColor(2)),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => onPress(3),
                    child: SvgPicture.asset(
                      _heartIcon,
                      semanticsLabel: 'heart icon',
                      colorFilter: ColorFilter.mode(
                        HexColor(onChangeColor(3)),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => onPress(4),
                    child: SvgPicture.asset(
                      _notificationIcon,
                      semanticsLabel: 'notification icon',
                      colorFilter: ColorFilter.mode(
                        HexColor(onChangeColor(4)),
                        BlendMode.srcIn,
                      ),
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
