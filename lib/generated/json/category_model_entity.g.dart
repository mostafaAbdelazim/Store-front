import 'package:task/generated/json/base/json_convert_content.dart';
import 'package:task/model/category_model_entity.dart';

CategoryModelEntity $CategoryModelEntityFromJson(Map<String, dynamic> json) {
  final CategoryModelEntity categoryModelEntity = CategoryModelEntity();
  final String? image = jsonConvert.convert<String>(json['image']);
  if (image != null) {
    categoryModelEntity.image = image;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    categoryModelEntity.title = title;
  }
  return categoryModelEntity;
}

Map<String, dynamic> $CategoryModelEntityToJson(CategoryModelEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['image'] = entity.image;
  data['title'] = entity.title;
  return data;
}
