import 'package:form_inputs/form_inputs.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../../../core/errors/models/error_info.dart';
import '../entities/category_upsert_req_entity.dart';
import '../repo/categories_repo.dart';
import '../entities/categories_res_entity.dart';

@singleton
class CategoriesUseCases {
  final CategoriesRepo categoriesRepo;
  CategoriesUseCases({required this.categoriesRepo});
  Future<ApiResult<List<CategoryEntity>>> get() async {
    return await categoriesRepo.get();
  }

  Future<ApiResult<CategoryEntity>> upsert({
    required CategoryUpsertReqEntity req,
  }) async {
    if (req.imageFile != null) {
      final result = await categoriesRepo.presignedImageUrl(
        extension: req.imageFile!.value!.path.split('.').last,
      );
      return await result.when(
        success: (s3Info) async {
          try {
            return await categoriesRepo.upsert(
              req: req.copyWith(
                imageUrl: GenericFormInput.dirty(value: s3Info?.filePath ?? ''),
              ),
            );
          } catch (e) {
            return ApiResult.failure(
              errorInfo: ErrorInfo(message: 'Failed to upload avatar'),
            );
          }
        },
        failure: (failure) {
          return ApiResult.failure(errorInfo: failure);
        },
      );
    } else {
      return await categoriesRepo.upsert(req: req);
    }
  }
}
