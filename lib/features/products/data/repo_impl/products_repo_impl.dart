import 'package:alzefr_dash/features/products/data/mapper/products_mapper.dart';
import 'package:alzefr_dash/features/products/domain/entities/product_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../profile/data/mappers/profile_model_mapper.dart';
import '../../../profile/data/models/presigned_url_req_model.dart';
import '../../../profile/domain/entities/presigned_url_entity.dart';
import '../../domain/entities/product_upsert_req_entity.dart';
import '../model/product_model.dart';
import '../../domain/repo/products_repo.dart';
import '../data_sources/products_api.dart';

@LazySingleton(as: ProductsRepo)
class ProductsRepoImpl implements ProductsRepo {
  final ProductsApi productsApi;

  ProductsRepoImpl(this.productsApi);
  @override
  Future<ApiResult<List<ProductEntity>>> get() async {
    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('products').get();
      final products = querySnapshot.docs.map((doc) {
        return ProductModel.fromJson(doc.data()).toEntity();
      }).toList();
      return ApiResult.success(data: products);
    } catch (e, s) {
      return ApiResult.failure(errorInfo: ErrorHandler.handle(e, s));
    }
  }

  @override
  Future<ApiResult<PresignedUrlEntity>> presignedImageUrl({
    required String extension,
  }) async {
    try {
      final result = await productsApi.presignedUrl(
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
  Future<ApiResult<ProductEntity>> upsert({
    required ProductUpsertReqEntity req,
  }) async {
    try {
      if (req.id == null) {
        // await productsApi.create(req.toModel());
      } else {
        // await productsApi.update(id: req.id!, req: req.toModel());
      }
      return ApiResult.success(
        data: null,
        //  res.toEntity()
      );
    } catch (e, s) {
      return ApiResult.failure(errorInfo: ErrorHandler.handle(e, s));
    }
  }
}
