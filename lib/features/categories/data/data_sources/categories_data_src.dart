import '../model/categories_res_model.dart';

abstract interface class CategoriesDataSrc {
  Future<List<CategoryModel>> get();
}
