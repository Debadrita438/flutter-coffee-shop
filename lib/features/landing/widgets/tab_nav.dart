import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:coffee_shop/utils/colors.dart';
import 'package:coffee_shop/common_widgets/index.dart';

class TabNav extends StatelessWidget {
  const TabNav({
    super.key,
    required this.tabList,
    required this.currentIndex,
    required this.setIndexHandler,
  });

  final List<String> tabList;

  final int currentIndex;

  final void Function(int index) setIndexHandler;

  double _changedPositionOfLine() {
    switch (currentIndex) {
      case 0:
        return 5;
      case 1:
        return 35;
      case 2:
        return 140;
      case 3:
        return 220;
      default:
        return 0;
    }
  }

  double _changedContainerWidth() {
    switch (currentIndex) {
      case 0:
        return 10;
      case 1:
        return 90;
      case 2:
        return 65;
      case 3:
        return 80;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width,
      height: screenSize.height * 0.05,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              width: screenSize.width,
              height: screenSize.height * 0.04,
              child: ListView.builder(
                itemCount: tabList.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => setIndexHandler(index),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: index == 0 ? 10 : 15,
                        top: 7,
                      ),
                      child: SemiBoldText(
                        showText: tabList[index],
                        textColor: currentIndex == index
                            ? AppColor.orange
                            : AppColor.lightGray,
                      ),
                    ),
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
          AnimatedPositioned(
            bottom: 0,
            curve: Curves.fastLinearToSlowEaseIn,
            left: _changedPositionOfLine(),
            duration: const Duration(milliseconds: 500),
            child: AnimatedContainer(
              curve: Curves.fastLinearToSlowEaseIn,
              margin: const EdgeInsets.only(left: 10),
              duration: const Duration(milliseconds: 500),
              width: _changedContainerWidth(),
              height: screenSize.height * 0.008,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: HexColor(AppColor.orange),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
