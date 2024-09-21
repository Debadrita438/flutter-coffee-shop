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
  List<dynamic> coffeeList;
  Map<String, dynamic> singleCoffeeDetails;
  String size;
  String message;

  CoffeeModel copyWith({
    ApiStatus? status,
    List? coffeeList,
    Map<String, dynamic>? singleCoffeeDetails,
    String? size,
  }) {
    return CoffeeModel(
      status: status ?? this.status,
      coffeeList: coffeeList ?? this.coffeeList,
      singleCoffeeDetails: singleCoffeeDetails ?? this.singleCoffeeDetails,
      size: size ?? this.size,
    );
  }
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
  List<dynamic> beansList;
  Map<String, dynamic> singleBeanDetails;
  String weight;
  String message;

  BeansModel copyWith({
    ApiStatus? status,
    List? beansList,
    Map<String, dynamic>? singleBeanDetails,
    String? weight,
  }) {
    return BeansModel(
      status: status ?? this.status,
      beansList: beansList ?? this.beansList,
      singleBeanDetails: singleBeanDetails ?? this.singleBeanDetails,
      weight: weight ?? this.weight,
    );
  }
}
