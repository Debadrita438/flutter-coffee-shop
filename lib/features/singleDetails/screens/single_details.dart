import 'package:coffee_shop/common_widgets/index.dart';
import 'package:coffee_shop/features/singleDetails/widgets/details_header.dart';
import 'package:coffee_shop/utils/colors.dart';
import 'package:coffee_shop/utils/icons.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class SingleDetailsScreen extends ConsumerWidget {
  const SingleDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.65,
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/flutter-coffee-shop-f87ba.appspot.com/o/Robusta.png?alt=media&token=520e448f-655f-4a0a-b5e1-a448cc3b2a6c',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.05,
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const DetailsHeader(),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                padding: const EdgeInsetsDirectional.all(10),
                decoration: BoxDecoration(
                  color: HexColor(AppColor.blackOp5),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SemiBoldText(
                                  showText: 'Robusta Beans',
                                  fontSize: 20,
                                ),
                                RegularText(
                                  showText: 'From Africa',
                                  fontSize: 12,
                                  textColor: AppColor.gray,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 56,
                                  height: 56,
                                  decoration: BoxDecoration(
                                    color: HexColor(AppColor.grayishBlack),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    border: Border.all(
                                      color:
                                          HexColor(AppColor.transparentWhite),
                                      width: 1,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(2),
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                        AppIcons.beanIcon,
                                        semanticsLabel: 'My SVG Image',
                                      ),
                                      const MediumText(
                                        showText: 'Bean',
                                        fontSize: 10,
                                        textColor: AppColor.gray,
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 56,
                                  height: 56,
                                  decoration: BoxDecoration(
                                    color: HexColor(AppColor.grayishBlack),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    border: Border.all(
                                      color:
                                          HexColor(AppColor.transparentWhite),
                                      width: 1,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                        AppIcons.locationIcon,
                                        semanticsLabel: 'My SVG Image',
                                      ),
                                      const MediumText(
                                        showText: 'Africa',
                                        fontSize: 10,
                                        textColor: AppColor.gray,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text('test')
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
