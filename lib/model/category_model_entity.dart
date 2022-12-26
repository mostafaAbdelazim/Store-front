import 'dart:convert';

import 'package:task/generated/json/base/json_field.dart';
import 'package:task/generated/json/category_model_entity.g.dart';

@JsonSerializable()
class CategoryModelEntity {
  late String image;
  late String title;

  CategoryModelEntity();

  factory CategoryModelEntity.fromJson(Map<String, dynamic> json) =>
      $CategoryModelEntityFromJson(json);

  Map<String, dynamic> toJson() => $CategoryModelEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
