import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/error_handler.dart';
import '../../../../core/services/presigned_image_uploader.dart';
import '../../../profile/data/mappers/profile_model_mapper.dart';
import '../../../profile/data/models/presigned_url_req_model.dart';
import '../../../profile/domain/entities/presigned_url_entity.dart';
import '../../data/data_sources/categories_api.dart';
import '../../data/data_sources/categories_data_src.dart';
import '../../data/mapper/categories_mapper.dart';
import '../../domain/entities/categories_res_entity.dart';
import '../../domain/entities/category_upsert_req_entity.dart';
import '../../domain/repo/categories_repo.dart';
import '../../../../core/networking/api_result.dart';

@Singleton(as: CategoriesRepo)
class CategoriesRepoImpl implements CategoriesRepo {
  final CategoriesApi categoriesApi;
  final CategoriesDataSrc categoriesDataSrc;
  final PresignedImageUploader imageUploader;
  CategoriesRepoImpl(
    this.categoriesApi,
    this.categoriesDataSrc,
    this.imageUploader,
  );

  @override
  Future<ApiResult<List<CategoryEntity>>> get() async {
    try {
      final categories = await categoriesDataSrc.get();
      return ApiResult.success(
        data: categories.map((e) => e.toEntity()).toList(),
      );
    } catch (e, s) {
      return ApiResult.failure(errorInfo: ErrorHandler.handle(e, s));
    }
  }

  @override
  Future<ApiResult<PresignedUrlEntity>> presignedImageUrl({
    required String extension,
    required String categoryId,
  }) async {
    try {
      final result = await categoriesApi.presignedUrl(
        id: categoryId,
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
  Future<ApiResult<UploadedImage>> uploadImage({
    required PresignedUrlEntity link,
    required XFile image,
  }) async {
    try {
      return ApiResult.success(
        data: await imageUploader.upload(link: link, image: image),
      );
    } catch (e, s) {
      return ApiResult.failure(errorInfo: ErrorHandler.handle(e, s));
    }
  }

  @override
  Future<ApiResult<CategoryEntity>> upsert({
    required CategoryUpsertReqEntity req,
  }) async {
    try {
      final res = await categoriesDataSrc.upsert(req.toModel());
      return ApiResult.success(data: res.toEntity());
    } catch (e, s) {
      return ApiResult.failure(errorInfo: ErrorHandler.handle(e, s));
    }
  }
}
