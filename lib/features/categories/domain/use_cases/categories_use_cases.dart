import 'package:form_inputs/form_inputs.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/models/error_info.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/utils/image_file_extension.dart';
import '../entities/categories_res_entity.dart';
import '../entities/category_upsert_req_entity.dart';
import '../repo/categories_repo.dart';

@singleton
class CategoriesUseCases {
  final CategoriesRepo categoriesRepo;
  CategoriesUseCases({required this.categoriesRepo});
  Future<ApiResult<List<CategoryEntity>>> get() async {
    return await categoriesRepo.get();
  }

  Future<ApiResult<void>> delete(int id) async {
    return await categoriesRepo.delete(id);
  }

  /// Save a category, uploading a freshly picked image first when there is one.
  ///
  /// The image travels the same three steps as a product image: the backend
  /// issues an upload link, the dashboard posts the file to it, and the path it
  /// answers with is what gets written to Firestore as the category image.
  Future<ApiResult<CategoryEntity>> upsert({
    required CategoryUpsertReqEntity req,
  }) async {
    final image = req.imageFile?.value;
    if (image == null) {
      return await categoriesRepo.upsert(req: req);
    }

    final String extension;
    try {
      extension = imageFileExtension(image);
    } on FormatException {
      return ApiResult.failure(
        errorInfo: const ErrorInfo(
          message: 'تعذّر تحديد نوع الصورة، اختر ملف صورة بصيغة معروفة',
        ),
      );
    }

    final link = await categoriesRepo.presignedImageUrl(
      extension: extension,
      categoryId: (req.id ?? 0).toString(),
    );

    return await link.when(
      success: (presignedUrl) async {
        if (presignedUrl == null) {
          return ApiResult.failure(
            errorInfo: const ErrorInfo(message: 'لم يُرجع الخادم رابط الرفع'),
          );
        }

        final uploaded = await categoriesRepo.uploadImage(
          link: presignedUrl,
          image: image,
        );

        return await uploaded.when(
          success: (storedImage) async {
            final filePath =
                storedImage?.filePath ?? presignedUrl.filePath ?? '';
            if (filePath.isEmpty) {
              return ApiResult.failure(
                errorInfo: const ErrorInfo(
                  message: 'لم يُرجع الخادم مسار الصورة',
                ),
              );
            }
            return await categoriesRepo.upsert(
              req: req.copyWith(
                imageUrl: GenericFormInput.dirty(value: filePath),
              ),
            );
          },
          failure: (errorInfo) async {
            return ApiResult.failure(
              errorInfo: errorInfo.copyWith(
                message: errorInfo.message.isEmpty
                    ? 'فشل رفع صورة التصنيف'
                    : errorInfo.message,
              ),
            );
          },
        );
      },
      failure: (errorInfo) async {
        return ApiResult.failure(
          errorInfo: errorInfo.copyWith(
            message: errorInfo.message.isEmpty
                ? 'فشل طلب رابط رفع صورة التصنيف'
                : errorInfo.message,
          ),
        );
      },
    );
  }
}
