import 'package:coffee_shop/utils/environment.dart';
import 'package:dio/dio.dart';

Dio createDioInstance() {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: Environment.apiUrl,
      headers: {
        "Content-Type": "application/json",
      },
    ),
  );
  return dio;
}
