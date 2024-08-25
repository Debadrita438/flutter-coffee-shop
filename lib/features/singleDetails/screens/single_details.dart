import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:coffee_shop/common_widgets/index.dart';
import 'package:coffee_shop/features/singleDetails/widgets/details_header.dart';
import 'package:coffee_shop/utils/colors.dart';
import 'package:coffee_shop/utils/icons.dart';

class SingleDetailsScreen extends ConsumerWidget {
  const SingleDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          // Bottom Box (Non-Transparent)
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.1,
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 10,
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RegularText(
                          showText: 'Price',
                          fontSize: 12,
                        ),
                        Row(
                          children: [
                            SemiBoldText(
                              showText: '\$',
                              textColor: AppColor.orange,
                              fontSize: 20,
                            ),
                            SizedBox(width: 5),
                            SemiBoldText(
                              showText: '10.50',
                              fontSize: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        width: 200,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: HexColor(AppColor.orange),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: const Center(
                          child: SemiBoldText(
                            showText: 'Add to Cart',
                            fontSize: 16,
                            textColor: AppColor.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Image and Scrollable Content
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/flutter-coffee-shop-f87ba.appspot.com/o/Robusta.png?alt=media&token=520e448f-655f-4a0a-b5e1-a448cc3b2a6c',
                        fit: BoxFit.cover,
                      ),
                    ),
                    // header
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.05,
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: const DetailsHeader(),
                      ),
                    ),
                    // transparent bottom
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SemiBoldText(
                                          showText: 'Robusta Beans',
                                          fontSize: 20,
                                        ),
                                        RegularText(
                                          showText: 'From Africa',
                                          fontSize: 16,
                                          textColor: AppColor.gray,
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.35,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 56,
                                          height: 56,
                                          decoration: BoxDecoration(
                                            color: HexColor(AppColor.darkBlue),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                            border: Border.all(
                                              color: HexColor(
                                                  AppColor.transparentWhite),
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
                                            color: HexColor(AppColor.darkBlue),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                            border: Border.all(
                                              color: HexColor(
                                                  AppColor.transparentWhite),
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
                            // Rating and medium rosated.
                            Flexible(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 25,
                                          height: 25,
                                          child: SvgPicture.asset(
                                            AppIcons.starIcon,
                                            semanticsLabel: 'star',
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        const SemiBoldText(
                                          showText: '4.5',
                                          fontSize: 14,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.35,
                                    child: Container(
                                      width: 56,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        color: HexColor(AppColor.darkBlue),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        border: Border.all(
                                          color: HexColor(
                                              AppColor.transparentWhite),
                                          width: 1,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      padding: const EdgeInsets.all(2),
                                      child: const Center(
                                        child: MediumText(
                                          showText: 'Medium Roasted',
                                          fontSize: 10,
                                          textColor: AppColor.gray,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // SingleChildScrollView for the description
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const MediumText(
                            showText: 'Description',
                            fontSize: 16,
                            textColor: AppColor.white,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const RegularText(
                            showText:
                                'Arabica beans are by far the most popular type of coffee beans, making up about 60% of the world’s coffee. These tasty beans originated many centuries ago in the highlands of Ethiopia, and may even be the first coffee beans ever consumed!',
                            fontSize: 12,
                            textColor: AppColor.gray,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const MediumText(
                            showText: 'Size',
                            fontSize: 16,
                            textColor: AppColor.white,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.height * 0.12,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: HexColor(AppColor.darkBlue),
                                      border: Border.all(
                                        color: HexColor(AppColor.orange),
                                        width: 2,
                                      )),
                                  child: const Center(
                                    child: SemiBoldText(
                                      showText: '250gm',
                                      fontSize: 12,
                                      textColor: AppColor.orange,
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.height * 0.12,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: HexColor(AppColor.darkBlue),
                                      border: Border.all(
                                        color: HexColor(AppColor.darkBlue),
                                        width: 2,
                                      )),
                                  child: const Center(
                                    child: SemiBoldText(
                                      showText: '250gm',
                                      fontSize: 12,
                                      textColor: AppColor.gray,
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.height * 0.12,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: HexColor(AppColor.darkBlue),
                                      border: Border.all(
                                        color: HexColor(AppColor.orange),
                                        width: 2,
                                      )),
                                  child: const Center(
                                    child: SemiBoldText(
                                      showText: '250gm',
                                      fontSize: 12,
                                      textColor: AppColor.orange,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
