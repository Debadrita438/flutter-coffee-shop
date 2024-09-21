import 'dart:convert';

import 'package:coffee_shop/utils/api_endpoints.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:coffee_shop/utils/api_status.dart';
import 'package:coffee_shop/utils/dio_intance.dart';
import 'package:coffee_shop/features/landing/models/dashboard_model.dart';

class BeansNotifier extends StateNotifier<BeansModel> {
  // initial state = {coffeeList: [], status: 'idle', message: ''}
  BeansNotifier()
      : super(
          BeansModel(
            status: ApiStatus.idle,
            beansList: [],
            singleBeanDetails: {},
            weight: '250',
          ),
        );

  Future<void> fetchBeansList() async {
    dynamic response;
    Dio dio = createDioInstance();

    response = await dio.get(ApiEndpoints.beanList);
    if (response != null) {
      for (final item in json.decode(response.toString()).entries) {
        if (state.beansList.isNotEmpty &&
            state.beansList[0]['_id'] == item.key) {
          return;
        } else {
          Map<String, dynamic> obj = {"_id": item.key, ...item.value};
          state.beansList = [...state.beansList, obj];
        }
      }
    }
  }

  void fetchSingleBeanDetails(String id) {
    var coffeeArr =
        state.beansList.where((element) => element['_id'] == id).toList();
    state.singleBeanDetails = {'type': 'Beans', ...coffeeArr[0]};
  }

  void storeWeight(String weight) {
    state = state.copyWith(weight: weight);
  }
}

final beansProvider = StateNotifierProvider<BeansNotifier, BeansModel>(
  (ref) => BeansNotifier(),
);
