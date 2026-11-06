import '../model/categories_res_model.dart';
import '../model/category_upsert_model.dart';

abstract interface class CategoriesDataSrc {
  Future<List<CategoryModel>> get();
  Future<CategoryModel> upsert(CategoryUpsertReqModel req);
}
