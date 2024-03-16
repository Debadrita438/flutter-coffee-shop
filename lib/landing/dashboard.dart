import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  final String iconPath = "assets/icons/menu.svg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 40),
        child: Column(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(color: Colors.red),
              child: SvgPicture.asset(
                iconPath,
                semanticsLabel: 'My SVG Image',
                height: 50,
                width: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
