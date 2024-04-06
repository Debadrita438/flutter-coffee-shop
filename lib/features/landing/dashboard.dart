import 'package:coffee_shop/common_widgets/semi_bold_text.dart';
import 'package:coffee_shop/features/landing/widgets/search_text_field.dart';
import 'package:coffee_shop/features/landing/widgets/tab_nav.dart';
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

  final String _starIcon = 'assets/icons/star.svg';

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

  void _setIndexHandler(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
            SearchTextField(searchController: _searchController),
            const SizedBox(height: 20),
            TabNav(
              tabList: _tabList,
              currentIndex: _currentIndex,
              setIndexHandler: _setIndexHandler,
            ),
            const SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width * 0.45,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 15,
              ),
              decoration: BoxDecoration(
                color: HexColor(AppColor.grayishBlack),
                borderRadius: BorderRadius.circular(23),
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(94, 128, 128, 128),
                    Color.fromARGB(0, 0, 0, 0)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Image.asset(
                          'assets/images/coffee.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        height: 28,
                        width: 70,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(16),
                              bottomLeft: Radius.circular(23),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 15,
                                height: 15,
                                child: SvgPicture.asset(
                                  _starIcon,
                                  semanticsLabel: 'star',
                                ),
                              ),
                              const SemiBoldText(
                                showText: '4.2',
                                fontSize: 14,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 10),
                    child: const RegularText(
                      showText: 'Cappuccino',
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const SizedBox(
                    width: double.infinity,
                    child: RegularText(
                      showText: 'With Steamed Milk',
                      fontSize: 11,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const SizedBox(
                    child: Row(
                      children: [
                        SemiBoldText(
                          showText: '\$',
                          textColor: AppColor.orange,
                          fontSize: 20,
                        ),
                        SizedBox(width: 5),
                        SemiBoldText(
                          showText: '4.20',
                          fontSize: 20,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
