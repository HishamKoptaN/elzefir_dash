import 'package:form_inputs/form_inputs.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../core/errors/models/error_info.dart';
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

  Future<ApiResult<ProductEntity>> upsert({
    required ProductUpsertReqEntity req,
  }) async {
    if (req.imageFile != null) {
      final result = await productsRepo.presignedImageUrl(
        extension: req.imageFile!.value!.path.split('.').last,
      );
      return await result.when(
        success: (s3Info) async {
          try {
            return await productsRepo.upsert(
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
      return await productsRepo.upsert(req: req);
    }
  }
}
