import 'package:coffee_shop/common_widgets/frosted_bottom_tab.dart';
import 'package:coffee_shop/features/landing/dashboard.dart';
import 'package:flutter/material.dart';

class ShopListScreen extends StatelessWidget {
  const ShopListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Center(
            child: Text('test'),
          ),
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
    ));
  }
}
