import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:coffee_shop/features/landing/widgets/coffee_beans_list.dart';
import 'package:coffee_shop/features/landing/widgets/search_text_field.dart';
import 'package:coffee_shop/features/landing/widgets/tab_nav.dart';
import 'package:coffee_shop/common_widgets/index.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  final _searchController = TextEditingController();

  final List<String> _tabList = [
    'All',
    'Cappuccino',
    'Espresso',
    'Americano',
  ];

  int _currentIndex = 0;
  int currentPageIndex = 0;
  String _searchText = '';

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

  void _searchHandler(String text) {
    setState(() {
      _searchText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MainHeader(),
              const SizedBox(height: 25),
              const SemiBoldText(
                showText: 'Find the best\ncoffee for you',
                fontSize: 28,
              ),
              const SizedBox(height: 25),
              SearchTextField(
                searchController: _searchController,
                onSearch: _searchHandler,
              ),
              const SizedBox(height: 20),
              TabNav(
                tabList: _tabList,
                currentIndex: _currentIndex,
                setIndexHandler: _setIndexHandler,
              ),
              const SizedBox(height: 15),
              CoffeeBeansList(
                type: 'coffee',
                searchText: _searchText,
              ),
              const SizedBox(height: 15),
              const MediumText(
                showText: 'Coffee beans',
                fontSize: 20,
              ),
              const SizedBox(height: 15),
              const CoffeeBeansList(
                type: 'beans',
              ),
              const SizedBox(height: 65),
            ],
          ),
        ),
      ),
    );
  }
}
