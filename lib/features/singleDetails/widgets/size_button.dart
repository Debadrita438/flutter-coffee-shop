import 'package:coffee_shop/features/landing/provider/beans_provider.dart';
import 'package:coffee_shop/features/landing/provider/coffee_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:coffee_shop/common_widgets/index.dart';
import 'package:coffee_shop/utils/colors.dart';

class SizeButton extends ConsumerWidget {
  const SizeButton({super.key, required this.buttonText, required this.type});

  final String buttonText;
  final String type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = type == 'coffee'
        ? ref.watch(coffeeProvider).size
        : ref.watch(beansProvider).weight;

    return InkWell(
      onTap: () {
        if (type == 'coffee') {
          ref.read(coffeeProvider.notifier).storeSize(buttonText);
        } else {
          ref.read(beansProvider.notifier).storeWeight(buttonText);
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.height * 0.12,
        height: MediaQuery.of(context).size.height * 0.05,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: HexColor(AppColor.darkBlue),
            border: Border.all(
              color: buttonText.contains(size)
                  ? HexColor(AppColor.orange)
                  : HexColor(AppColor.darkBlue),
              width: 2,
            )),
        child: Center(
          child: SemiBoldText(
            showText: buttonText,
            fontSize: 12,
            textColor:
                buttonText.contains(size) ? AppColor.orange : AppColor.gray,
          ),
        ),
      ),
    );
  }
}
