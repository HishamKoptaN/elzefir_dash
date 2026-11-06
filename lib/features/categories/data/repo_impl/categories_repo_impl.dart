import 'package:injectable/injectable.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../../../../core/errors/error_handler.dart';
import '../../../products/domain/entities/product_entity.dart';
import '../../../products/domain/entities/product_upsert_req_entity.dart';
import '../../../profile/data/mappers/profile_model_mapper.dart';
import '../../../profile/data/models/presigned_url_req_model.dart';
import '../../../profile/domain/entities/presigned_url_entity.dart';
import '../../data/data_sources/categories_data_src.dart';
import '../../data/mapper/categories_mapper.dart';
import '../../domain/entities/categories_res_entity.dart';
import '../../domain/entities/category_upsert_req_entity.dart';
import '../../domain/repo/categories_repo.dart';
import '../data_sources/categories_api.dart';
import '../model/categories_res_model.dart';

@Singleton(as: CategoriesRepo)
class SallaOptionCategoriesRepoImpl implements CategoriesRepo {
  final CategoriesApi categoriesApi;
  final CategoriesDataSrc categoriesDataSrc;
  SallaOptionCategoriesRepoImpl(this.categoriesApi, this.categoriesDataSrc);
  @override
  Future<ApiResult<List<CategoryEntity>>> get() async {
    try {
      return await categoriesDataSrc.get().then((res) {
        return ApiResult.success(
          data: res.map((e) {
            return e.toEntity();
          }).toList(),
        );
      });
    } catch (e, s) {
      return ApiResult.failure(errorInfo: ErrorHandler.handle(e, s));
    }
  }

  @override
  Future<ApiResult<PresignedUrlEntity>> presignedImageUrl({
    required String extension,
  }) async {
    try {
      final result = await categoriesApi.presignedUrl(
        presignedUrlReqModel: PresignedUrlReqModel(
          extensionProperty: extension,
        ),
      );
      return ApiResult.success(data: result.toEntity());
    } catch (e, st) {
      return ApiResult.failure(errorInfo: ErrorHandler.handle(e, st));
    }
  }

  @override
  Future<ApiResult<CategoryEntity>> upsert({
    required CategoryUpsertReqEntity req,
  }) async {
    try {
      late CategoryModel res;
      if (req.id == null) {
        res = await categoriesApi.create(req.toModel());
      } else {
        res = await categoriesApi.update(id: req.id!, req: req.toModel());
      }
      return ApiResult.success(data: res.toEntity());
    } catch (e, s) {
      return ApiResult.failure(errorInfo: ErrorHandler.handle(e, s));
    }
  }
}
