part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class ProductsReadyState extends HomeState {
  List<ProductModelEntity> products;

  ProductsReadyState({required this.products});
}

class CategoriesReadyState extends HomeState {
  List<CategoryModelEntity> categories;

  CategoriesReadyState({required this.categories});
}
