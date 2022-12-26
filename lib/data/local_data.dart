import 'dart:convert';

import 'package:task/data/task_repository.dart';
import 'package:task/generated/json/base/json_convert_content.dart';
import 'package:task/model/category_model_entity.dart';
import 'package:task/model/product_model_entity.dart';

class LocalDataProvider extends TaskRepository {
  @override
  Future<List<CategoryModelEntity>> getCategories() async {
    List<dynamic> decodedJson = jsonDecode(categoriesJson) as List<dynamic>;
    return List.generate(
        decodedJson.length,
        (index) =>
            JsonConvert.fromJsonAsT<CategoryModelEntity>(decodedJson[index])!);
  }

  @override
  Future<List<ProductModelEntity>> getProducts() async {
    List<dynamic> decodedJson = jsonDecode(productsJson) as List<dynamic>;
    return List.generate(
        decodedJson.length,
        (index) =>
            JsonConvert.fromJsonAsT<ProductModelEntity>(decodedJson[index])!);
  }
}

String productsJson =
    '[{"backgroundColor":"0xff265D8F","image":"https://i.pinimg.com/originals/c1/dc/78/c1dc789fb4da37fd8dbcca718d092fc7.png","name":"بيض محلي","promotion":"خصم كبير علي اكثر من 150 كرتونة","price":"12 ريال للكرتونة (0.25 ريال للحبة)"},{"backgroundColor": "0xff4085B6","image":"https://purepng.com/public/uploads/large/purepng.com-olive-oilolive-oiloliveoilcrop-1411527968157j3fmw.png","name":"زيت العربي محلي الصنع","promotion":"خصم كبير علي اكثر من 100 زجاجة","price":"36 ريال للكرتونة (4 ريال للحبة)"},{"backgroundColor":"0xffBC242A","image": "https://www.pnglib.com/wp-content/uploads/2021/02/chicken-png-royalty-free_6021322e39f6b.png","name": "دجاج اليوم، فاخر طازج","promotion":"خصم كبير علي اكثر من 50 دجاجة","price": "25 ريال للكيلو"},{"backgroundColor":"0xFFAFB42B","image": "https://png.monster/wp-content/uploads/2022/06/png.monster-543.png","name": "لحوم طازجة","promotion": "خصم كبير علي اكثر من 20 كيلو","price": "40 ريال للكيلو"},{"backgroundColor": "0xFF673AB7","image": "https://pngimg.com/uploads/fish/fish_PNG25175.png","name": "اسماك طازجة","promotion": "خصم كبير علي اكثر من 60 كيلو","price": "30 ريال للكيلو"}]';
String categoriesJson =
    '[{"image":"https://purepng.com/public/uploads/large/purepng.com-olive-oilolive-oiloliveoilcrop-1411527968157j3fmw.png","title":"الزيوت"},{"image":"https://i.pinimg.com/originals/c1/dc/78/c1dc789fb4da37fd8dbcca718d092fc7.png","title":"البيض" },{"image":"https://png.monster/wp-content/uploads/2022/06/png.monster-543.png","title":"اللحوم"},{"image":"https://www.pnglib.com/wp-content/uploads/2021/02/chicken-png-royalty-free_6021322e39f6b.png","title":"الدجاج"},{"image":"https://pngimg.com/uploads/fish/fish_PNG25175.png","title":"الاسماك"}]';
