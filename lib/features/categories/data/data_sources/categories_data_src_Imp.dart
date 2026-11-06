import 'package:injectable/injectable.dart';
import '../../../../config/env_config.dart';
import '../../data/data_sources/categories_api.dart';
import '../model/categories_res_model.dart';
import 'categories_data_src.dart';
import 'categories_mock_data_src.dart';

@Singleton(as: CategoriesDataSrc)
class CategoriesDataSrcImpl implements CategoriesDataSrc {
  final CategoriesApi api;
  final CategoriesMockDataSource mock;
  CategoriesDataSrcImpl({required this.api, required this.mock});
  @override
  Future<List<CategoryModel>> get() {
    switch (EnvConfig.config.dataSourceMode) {
      case DataSrcMode.api:
        return api.get();
      case DataSrcMode.mock:
        return mock.get();
    }
  }
}
