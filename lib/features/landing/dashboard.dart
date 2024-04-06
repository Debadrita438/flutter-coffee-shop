import 'package:coffee_shop/features/landing/widgets/search_text_field.dart';
import 'package:coffee_shop/features/landing/widgets/tab_nav.dart';
import 'package:flutter/material.dart';

import 'package:coffee_shop/common_widgets/index.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _searchController = TextEditingController();

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
            TabNav(
              tabList: _tabList,
              currentIndex: _currentIndex,
              setIndexHandler: _setIndexHandler,
            ),
          ],
        ),
      ),
    );
  }
}
