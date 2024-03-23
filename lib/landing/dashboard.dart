import 'package:flutter/material.dart';

import 'package:coffee_shop/common_widgets/index.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 45),
        child: Column(
          children: [
            const MainHeader(),
          ],
        ),
      ),
    );
  }
}
