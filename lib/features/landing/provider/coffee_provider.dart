import 'dart:convert';

import 'package:coffee_shop/utils/api_endpoints.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:coffee_shop/utils/api_status.dart';
import 'package:coffee_shop/utils/dio_intance.dart';
import 'package:coffee_shop/features/landing/models/dashboard_modal.dart';

class CoffeeNotifier extends StateNotifier<CoffeeModal> {
  // initial state = {coffeeList: [], status: 'idle', message: ''}
  CoffeeNotifier()
      : super(
          CoffeeModal(
            status: ApiStatus.idle,
            coffeeList: [],
          ),
        );

  Future<void> fetchCoffeeList() async {
    dynamic response;
    Dio dio = createDioInstance();

    response = await dio.get(ApiEndpoints.coffeeList);
    if (response != null) {
      Map<String, Map<String, dynamic>> apiResponse =
          json.decode(response.toString());
      print(apiResponse);
      for (final item in apiResponse.entries) {
        print(item.key);
        Map<String, dynamic> obj = {"_id": item.key, ...item.value};
        state.coffeeList = [...state.coffeeList, obj];
      }

      print(state.coffeeList);
    }
  }
}

final coffeeProvider = StateNotifierProvider<CoffeeNotifier, CoffeeModal>(
  (ref) => CoffeeNotifier(),
);
