import '../../../../../../core/networking/api_result.dart';
import '../../../profile/domain/entities/presigned_url_entity.dart';
import '../entities/categories_res_entity.dart';
import '../entities/category_upsert_req_entity.dart';

abstract class CategoriesRepo {
  Future<ApiResult<List<CategoryEntity>>> get();
  Future<ApiResult<PresignedUrlEntity>> presignedImageUrl({
    required String extension,
  });
  Future<ApiResult<CategoryEntity>> upsert({
    required CategoryUpsertReqEntity req,
  });
}
