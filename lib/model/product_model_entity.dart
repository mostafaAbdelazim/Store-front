import 'dart:convert';

import 'package:task/generated/json/base/json_field.dart';
import 'package:task/generated/json/product_model_entity.g.dart';

@JsonSerializable()
class ProductModelEntity {
  late String backgroundColor;
  late String image;
  late String name;
  late String promotion;
  late String price;

  ProductModelEntity();

  factory ProductModelEntity.fromJson(Map<String, dynamic> json) =>
      $ProductModelEntityFromJson(json);

  Map<String, dynamic> toJson() => $ProductModelEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
