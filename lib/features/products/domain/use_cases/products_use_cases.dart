import 'package:form_inputs/form_inputs.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../core/errors/models/error_info.dart';
import '../../../../core/utils/image_file_extension.dart';
import '../entities/product_entity.dart';
import '../entities/product_upsert_req_entity.dart';
import '../repo/products_repo.dart';

@singleton
class ProductsUseCase {
  final ProductsRepo productsRepo;
  ProductsUseCase({required this.productsRepo});
  Future<ApiResult<List<ProductEntity>>> get() async {
    return await productsRepo.get();
  }

  Future<ApiResult<void>> delete(int id) async {
    return await productsRepo.delete(id);
  }

  /// Save a product, uploading a freshly picked image first when there is one.
  ///
  /// The image travels in three steps: the backend issues an upload link, the
  /// dashboard posts the file to it, and the path it answers with is what gets
  /// written to Firestore as the product image.
  Future<ApiResult<ProductEntity>> upsert({
    required ProductUpsertReqEntity req,
  }) async {
    final image = req.imageFile?.value;
    if (image == null) {
      return await productsRepo.upsert(req: req);
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

    final link = await productsRepo.presignedImageUrl(
      extension: extension,
      // The backend only uses this as a hint for the generated file name.
      productId: req.id?.toString() ?? 'new',
    );

    return await link.when(
      success: (presignedUrl) async {
        if (presignedUrl == null) {
          return ApiResult.failure(
            errorInfo: const ErrorInfo(message: 'لم يُرجع الخادم رابط الرفع'),
          );
        }

        final uploaded = await productsRepo.uploadImage(
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
            return await productsRepo.upsert(
              req: req.copyWith(
                imageUrl: GenericFormInput.dirty(value: filePath),
              ),
            );
          },
          failure: (errorInfo) async {
            return ApiResult.failure(
              errorInfo: errorInfo.copyWith(
                message: errorInfo.message.isEmpty
                    ? 'فشل رفع صورة المنتج'
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
                ? 'فشل طلب رابط رفع صورة المنتج'
                : errorInfo.message,
          ),
        );
      },
    );
  }
}
