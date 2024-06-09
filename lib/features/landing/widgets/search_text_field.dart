import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:coffee_shop/utils/icons.dart';
import 'package:coffee_shop/utils/colors.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.searchController,
    required this.onSearch,
  });

  final TextEditingController searchController;
  final void Function(String text) onSearch;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(10, 15, 20, 10),
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
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          child: SvgPicture.asset(
            AppIcons.searchIcon,
            semanticsLabel: 'Search icon',
          ),
        ),
      ),
      onChanged: onSearch,
    );
  }
}
