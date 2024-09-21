import 'package:coffee_shop/utils/api_status.dart';

class CoffeeModel {
  CoffeeModel({
    required this.status,
    required this.coffeeList,
    required this.singleCoffeeDetails,
    required this.size,
    this.message = '',
  });

  ApiStatus status;
  List<Map<String, dynamic>> coffeeList;
  Map<String, dynamic> singleCoffeeDetails;
  String size;
  String message;
}

class BeansModel {
  BeansModel({
    required this.status,
    required this.beansList,
    required this.singleBeanDetails,
    required this.weight,
    this.message = '',
  });

  ApiStatus status;
  List<Map<String, dynamic>> beansList;
  Map<String, dynamic> singleBeanDetails;
  String weight;
  String message;
}
