import '../model/categories_res_model.dart';
import 'package:injectable/injectable.dart';

@singleton
class CategoriesMockDataSource {
  Future<List<CategoryModel>> get() async {
    return [];
  }
}
