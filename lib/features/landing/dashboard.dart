import 'package:coffee_shop/features/landing/widgets/coffee_item.dart';
import 'package:coffee_shop/features/landing/widgets/search_text_field.dart';
import 'package:coffee_shop/features/landing/widgets/tab_nav.dart';
import 'package:coffee_shop/features/shop/screens/shop_list.dart';
import 'package:flutter/material.dart';

import 'package:coffee_shop/common_widgets/index.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _searchController = TextEditingController();

  final String _plusIcon = 'assets/icons/plus.svg';

  final List<String> _tabList = [
    'All',
    'Cappuccino',
    'Espresso',
    'Americano',
  ];

  int _currentIndex = 0;
  int currentPageIndex = 0;

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
              SearchTextField(searchController: _searchController),
              const SizedBox(height: 20),
              TabNav(
                tabList: _tabList,
                currentIndex: _currentIndex,
                setIndexHandler: _setIndexHandler,
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.73,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CoffeeItemCard(
                      addRemoveIcon: _plusIcon,
                      showRating: true,
                      coffeeImage: 'assets/images/coffee.png',
                    );
                  },
                ),
              ),
              const SizedBox(height: 15),
              const MediumText(
                showText: 'Coffee beans',
                fontSize: 20,
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.73,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CoffeeItemCard(
                      addRemoveIcon: _plusIcon,
                      showRating: false,
                      coffeeImage: 'assets/images/beans.png',
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
