import 'package:coffee_shop/features/bottomTab/bottom_tab.dart';
import 'package:coffee_shop/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: HexColor(AppColor.backgroundColor),
        ),
        scaffoldBackgroundColor: HexColor(AppColor.backgroundColor),
      ),
      home: const BottomTab(),
    );
  }
}
