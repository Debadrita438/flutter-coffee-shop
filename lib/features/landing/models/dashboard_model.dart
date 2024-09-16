import 'package:coffee_shop/utils/api_status.dart';

class CoffeeModel {
  CoffeeModel({
    required this.status,
    required this.coffeeList,
    required this.singleCoffeeDetails,
    this.message = '',
  });

  ApiStatus status;
  List<Map<String, dynamic>> coffeeList;
  Map<String, dynamic> singleCoffeeDetails;
  String message;
}

class BeansModel {
  BeansModel({
    required this.status,
    required this.beansList,
    required this.singleBeansDetails,
    this.message = '',
  });

  ApiStatus status;
  List<Map<String, dynamic>> beansList;
  Map<String, dynamic> singleBeansDetails;
  String message;
}
