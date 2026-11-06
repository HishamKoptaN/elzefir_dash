import '../../../../../../core/networking/api_result.dart';
import '../../../profile/domain/entities/presigned_url_entity.dart';
import '../../../../core/services/presigned_image_uploader.dart';
import '../entities/categories_res_entity.dart';
import '../entities/category_upsert_req_entity.dart';
import 'package:image_picker/image_picker.dart';

abstract class CategoriesRepo {
  Future<ApiResult<List<CategoryEntity>>> get();

  /// Step 1: ask the backend for an upload link for this category's image.
  Future<ApiResult<PresignedUrlEntity>> presignedImageUrl({
    required String extension,
    required String categoryId,
  });

  /// Step 2: send the picked image to that link.
  Future<ApiResult<UploadedImage>> uploadImage({
    required PresignedUrlEntity link,
    required XFile image,
  });

  /// Step 3: persist the category, image path included, in Firestore.
  Future<ApiResult<CategoryEntity>> upsert({
    required CategoryUpsertReqEntity req,
  });
}
