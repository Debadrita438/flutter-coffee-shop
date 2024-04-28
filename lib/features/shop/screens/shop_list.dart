import 'package:coffee_shop/common_widgets/index.dart';
import 'package:coffee_shop/features/shop/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class ShopListScreen extends StatelessWidget {
  const ShopListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
        child: Column(
          children: [
            const MainHeader(
              displayHeaderText: true,
              headerText: 'Cart',
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => CartItem(),
                padding: const EdgeInsets.only(top: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
