import 'package:coffee_shop/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:coffee_shop/common_widgets/index.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _searchController = TextEditingController();

  final String _searchIcon = 'assets/icons/search.svg';

  final List<String> _tabList = [
    'All',
    'Cappuccino',
    'Espresso',
    'Americano',
  ];
  int _currentIndex = 0;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  double changedPositionOfLine() {
    switch (_currentIndex) {
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

  double changedContainerWidth() {
    switch (_currentIndex) {
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

  void _setIndexHandler(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 45),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MainHeader(),
            const SizedBox(height: 25),
            const Text(
              'Find the best\ncoffee for you',
              style: TextStyle(
                fontSize: 28,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(10, 15, 20, 10),
                hintText: 'Find your coffee...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                fillColor: const Color.fromARGB(255, 28, 31, 38),
                filled: true,
                hintStyle: TextStyle(
                  color: HexColor(AppColor.lightGray),
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                  child: SvgPicture.asset(
                    _searchIcon,
                    semanticsLabel: 'Search icon',
                  ),
                ),
              ),
            ),
            SizedBox(
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
                        itemCount: _tabList.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => _setIndexHandler(index),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: index == 0 ? 10 : 15,
                                top: 7,
                              ),
                              child: SemiBoldText(
                                showText: _tabList[index],
                                textColor: _currentIndex == index
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
                    left: changedPositionOfLine(),
                    duration: const Duration(milliseconds: 500),
                    child: AnimatedContainer(
                      curve: Curves.fastLinearToSlowEaseIn,
                      margin: const EdgeInsets.only(left: 10),
                      duration: const Duration(milliseconds: 500),
                      width: changedContainerWidth(),
                      height: screenSize.height * 0.008,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: HexColor(AppColor.orange),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
