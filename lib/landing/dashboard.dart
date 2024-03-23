import 'package:coffee_shop/utils/colors.dart';
import 'package:flutter/material.dart';

import 'package:coffee_shop/common_widgets/index.dart';
import 'package:hexcolor/hexcolor.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
