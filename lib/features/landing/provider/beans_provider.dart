import 'dart:convert';

import 'package:coffee_shop/utils/api_endpoints.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:coffee_shop/utils/api_status.dart';
import 'package:coffee_shop/utils/dio_intance.dart';
import 'package:coffee_shop/features/landing/models/dashboard_modal.dart';

class BeansNotifier extends StateNotifier<BeansModal> {
  // initial state = {coffeeList: [], status: 'idle', message: ''}
  BeansNotifier()
      : super(
          BeansModal(
            status: ApiStatus.idle,
            beansList: [],
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
}

final beansProvider = StateNotifierProvider<BeansNotifier, BeansModal>(
  (ref) => BeansNotifier(),
);
