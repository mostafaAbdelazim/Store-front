import 'package:task/generated/json/base/json_convert_content.dart';
import 'package:task/model/product_model_entity.dart';

ProductModelEntity $ProductModelEntityFromJson(Map<String, dynamic> json) {
  final ProductModelEntity productModelEntity = ProductModelEntity();
  final String? backgroundColor =
      jsonConvert.convert<String>(json['backgroundColor']);
  if (backgroundColor != null) {
    productModelEntity.backgroundColor = backgroundColor;
  }
  final String? image = jsonConvert.convert<String>(json['image']);
  if (image != null) {
    productModelEntity.image = image;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    productModelEntity.name = name;
  }
  final String? promotion = jsonConvert.convert<String>(json['promotion']);
  if (promotion != null) {
    productModelEntity.promotion = promotion;
  }
  final String? price = jsonConvert.convert<String>(json['price']);
  if (price != null) {
    productModelEntity.price = price;
  }
  return productModelEntity;
}

Map<String, dynamic> $ProductModelEntityToJson(ProductModelEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['backgroundColor'] = entity.backgroundColor;
  data['image'] = entity.image;
  data['name'] = entity.name;
  data['promotion'] = entity.promotion;
  data['price'] = entity.price;
  return data;
}
