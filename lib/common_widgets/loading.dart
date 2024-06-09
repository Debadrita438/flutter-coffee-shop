import 'package:coffee_shop/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.2,
        child: Column(
          children: [
            Lottie.asset(
              AppAnimations.loadingIcon,
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            Lottie.asset(
              AppAnimations.loadingDotIcon,
              height: MediaQuery.of(context).size.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
