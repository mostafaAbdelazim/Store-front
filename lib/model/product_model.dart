import 'dart:ui';

class ProductModel {
  String image;
  String name;
  String promotion;
  String price;
  Color backgroundColor;

  ProductModel({
    required this.backgroundColor,
    required this.image,
    required this.name,
    required this.promotion,
    required this.price,
  });
}
