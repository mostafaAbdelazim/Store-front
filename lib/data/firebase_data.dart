import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task/constants/constants.dart';
import 'package:task/data/task_repository.dart';
import 'package:task/generated/json/base/json_convert_content.dart';
import 'package:task/model/category_model_entity.dart';
import 'package:task/model/product_model_entity.dart';

class FirebaseDataProvider extends TaskRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<List<CategoryModelEntity>> getCategories() async {
    var result = await firestore.collection(kCategoriesTable).get();
    return List<CategoryModelEntity>.generate(
        result.docs.length,
        (index) => JsonConvert.fromJsonAsT<CategoryModelEntity>(
            result.docs[index].data())!);
  }

  @override
  Future<List<ProductModelEntity>> getProducts() async {
    var result = await firestore.collection(kProductsTable).get();
    return List<ProductModelEntity>.generate(
        result.docs.length,
        (index) => JsonConvert.fromJsonAsT<ProductModelEntity>(
            result.docs[index].data())!);
  }
}
