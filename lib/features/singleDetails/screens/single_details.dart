import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:coffee_shop/features/landing/provider/coffee_provider.dart';
import 'package:coffee_shop/features/singleDetails/widgets/description_size.dart';
import 'package:coffee_shop/features/singleDetails/widgets/image_info.dart';
import 'package:coffee_shop/features/singleDetails/widgets/bottom_box.dart';

class SingleDetailsScreen extends ConsumerStatefulWidget {
  const SingleDetailsScreen({
    super.key,
    required this.id,
  });

  final String id;

  @override
  ConsumerState<SingleDetailsScreen> createState() {
    return _SingleDetailsState();
  }
}

class _SingleDetailsState extends ConsumerState<SingleDetailsScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(coffeeProvider.notifier).fetchSingleCoffeeDetails(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          // Bottom Box (Non-Transparent)
          BottomBox(),
          // Image and Scrollable Content
          Column(
            children: [
              ImageInfoComponent(),
              // SingleChildScrollView for the description
              DescriptionSize(),
            ],
          ),
        ],
      ),
    );
  }
}
