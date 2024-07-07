import 'package:coffee_shop/utils/api_status.dart';

class CoffeeModal {
  CoffeeModal({
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

class BeansModal {
  BeansModal({
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
