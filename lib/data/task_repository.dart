import 'package:task/model/category_model_entity.dart';
import 'package:task/model/product_model_entity.dart';

abstract class TaskRepository {
  Future<List<ProductModelEntity>> getProducts();

  Future<List<CategoryModelEntity>> getCategories();
}
