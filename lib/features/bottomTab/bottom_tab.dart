import 'package:coffee_shop/features/landing/dashboard.dart';
import 'package:coffee_shop/features/landing/widgets/coffee_item.dart';
import 'package:coffee_shop/features/landing/widgets/search_text_field.dart';
import 'package:coffee_shop/features/landing/widgets/tab_nav.dart';
import 'package:coffee_shop/features/shop/screens/shop_list.dart';
import 'package:flutter/material.dart';

import 'package:coffee_shop/common_widgets/index.dart';

class BottomTab extends StatefulWidget {
  const BottomTab({super.key, required this.childWidget});

  final Widget childWidget;

  @override
  State<BottomTab> createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            widget.childWidget,
            Positioned(
              bottom: 10,
              right: 10,
              left: 10,
              child: FrostedBottomTab(onNavigate: (index) {
                if (index == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => const DashboardScreen(),
                    ),
                  );
                } else if (index == 2) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => const ShopListScreen(),
                    ),
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
