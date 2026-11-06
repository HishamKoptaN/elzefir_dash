import '../../../../../core/networking/api_result.dart';
import '../../../profile/domain/entities/presigned_url_entity.dart';
import '../entities/product_entity.dart';
import '../entities/product_upsert_req_entity.dart';

abstract class ProductsRepo {
  Future<ApiResult<List<ProductEntity>>> get();
  Future<ApiResult<PresignedUrlEntity>> presignedImageUrl({
    required String extension,
  });
  Future<ApiResult<ProductEntity>> upsert({
    required ProductUpsertReqEntity req,
  });
}
