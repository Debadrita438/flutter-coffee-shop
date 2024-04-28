import 'package:flutter/material.dart';

import 'package:coffee_shop/features/favorite/screens/favorite_list.dart';
import 'package:coffee_shop/features/landing/dashboard.dart';
import 'package:coffee_shop/features/notification/screens/notification.dart';
import 'package:coffee_shop/features/shop/screens/shop_list.dart';
import 'package:coffee_shop/utils/colors.dart';
import 'package:coffee_shop/common_widgets/index.dart';

class BottomTab extends StatefulWidget {
  const BottomTab({super.key});

  @override
  State<BottomTab> createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  int _selectedTab = 1;

  void selectedTabHandler(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  String changeColorHandler(int index) {
    if (index == _selectedTab) {
      return AppColor.orange;
    }
    return AppColor.white;
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const DashboardScreen();

    if (_selectedTab == 1) {
      content = const DashboardScreen();
    } else if (_selectedTab == 2) {
      content = const ShopListScreen();
    } else if (_selectedTab == 3) {
      content = const FavoriteListScreen();
    } else if (_selectedTab == 4) {
      content = const NotificationScreen();
    }

    return Scaffold(
      bottomNavigationBar: Stack(
        children: [
          content,
          // botom tab
          Positioned(
            bottom: 10,
            right: 10,
            left: 10,
            child: FrostedBottomTab(
              onPress: selectedTabHandler,
              onChangeColor: changeColorHandler,
            ),
          ),
        ],
      ),
    );
  }
}
