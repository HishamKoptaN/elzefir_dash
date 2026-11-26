import 'package:alzefr_dash/core/networking/api_result.dart';
import 'package:alzefr_dash/core/services/presigned_image_uploader.dart';
import 'package:alzefr_dash/features/products/domain/entities/product_entity.dart';
import 'package:alzefr_dash/features/products/domain/entities/product_upsert_req_entity.dart';
import 'package:alzefr_dash/features/profile/domain/entities/presigned_url_entity.dart';
import 'package:image_picker/image_picker.dart';

abstract class ProductsRepo {
  Future<ApiResult<List<ProductEntity>>> get();

  /// Step 1: ask the backend for an upload link for this product's image.
  Future<ApiResult<PresignedUrlEntity>> presignedImageUrl({
    required String extension,
    required String productId,
  });

  /// Step 2: send the picked image to that link.
  Future<ApiResult<UploadedImage>> uploadImage({
    required PresignedUrlEntity link,
    required XFile image,
  });

  /// Step 3: persist the product, image path included, in Firestore.
  Future<ApiResult<ProductEntity>> upsert({
    required ProductUpsertReqEntity req,
  });

  Future<ApiResult<void>> delete(int id);
}
