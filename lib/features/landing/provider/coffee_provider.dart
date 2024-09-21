import 'dart:convert';

import 'package:coffee_shop/utils/api_endpoints.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:coffee_shop/utils/api_status.dart';
import 'package:coffee_shop/utils/dio_intance.dart';
import 'package:coffee_shop/features/landing/models/dashboard_model.dart';

class CoffeeNotifier extends StateNotifier<CoffeeModel> {
  // initial state = {coffeeList: [], status: 'idle', message: ''}
  CoffeeNotifier()
      : super(
          CoffeeModel(
              status: ApiStatus.idle,
              coffeeList: [],
              singleCoffeeDetails: {},
              size: 'S'),
        );
  Future<void> fetchCoffeeList() async {
    dynamic response;
    Dio dio = createDioInstance();

    response = await dio.get(ApiEndpoints.coffeeList);
    if (response != null) {
      for (final item in json.decode(response.toString()).entries) {
        if (state.coffeeList.isNotEmpty &&
            state.coffeeList[0]['_id'] == item.key) {
          return;
        } else {
          Map<String, dynamic> obj = {"_id": item.key, ...item.value};
          state.coffeeList = [...state.coffeeList, obj];
        }
      }
    }
  }

  void fetchSingleCoffeeDetails(String id) {
    var coffeeArr =
        state.coffeeList.where((element) => element['_id'] == id).toList();
    state.singleCoffeeDetails = {'type': 'Coffee', ...coffeeArr[0]};
  }

  void storeSize(String size) {
    state.size = size;
  }
}

final coffeeProvider = StateNotifierProvider<CoffeeNotifier, CoffeeModel>(
  (ref) => CoffeeNotifier(),
);
