import 'package:coffee_shop/utils/api_status.dart';

class CoffeeModal {
  CoffeeModal({
    required this.status,
    required this.coffeeList,
    this.message = '',
  });

  ApiStatus status;
  List<Map<String, dynamic>> coffeeList;
  String message;
}

class BeansModal {
  BeansModal({
    required this.status,
    required this.beansList,
    this.message = '',
  });

  ApiStatus status;
  List<Map<String, dynamic>> beansList;
  String message;
}
