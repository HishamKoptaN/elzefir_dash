import 'package:alzefr_dash/features/products/data/mapper/products_mapper.dart';
import 'package:alzefr_dash/features/products/domain/entities/product_entity.dart';
import 'package:alzefr_dash/features/profile/domain/entities/presigned_url_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../categories/domain/entities/categories_res_entity.dart';
import '../../../profile/data/mappers/profile_model_mapper.dart';
import '../../../profile/data/models/presigned_url_req_model.dart';
import '../../domain/entities/product_upsert_req_entity.dart';
import '../../domain/repo/products_repo.dart';
import '../../../../core/services/presigned_image_uploader.dart';
import '../data_sources/products_api.dart';
import '../model/product_model.dart';

const String _productsCollection = 'products';

@LazySingleton(as: ProductsRepo)
class ProductsRepoImpl implements ProductsRepo {
  final ProductsApi productsApi;
  final PresignedImageUploader imageUploader;

  ProductsRepoImpl(this.productsApi, this.imageUploader);

  /// Resolved per call so the repository never holds Firestore state from
  /// before Firebase was initialized.
  FirebaseFirestore get _firestore => FirebaseFirestore.instance;

  @override
  Future<ApiResult<List<ProductEntity>>> get() async {
    try {
      final querySnapshot = await _firestore
          .collection(_productsCollection)
          .get()
          .timeout(const Duration(seconds: 15));
      final products = querySnapshot.docs.map((doc) {
        return ProductModel.fromJson(doc.data()).toEntity();
      }).toList();
      return ApiResult.success(data: products);
    } catch (e, s) {
      final errorInfo = ErrorHandler.handle(e, s);
      if (e is FirebaseException) {
        return ApiResult.failure(
          errorInfo: errorInfo.copyWith(title: '${e.plugin}: ${e.code}'),
        );
      }
      return ApiResult.failure(errorInfo: errorInfo);
    }
  }

  @override
  Future<ApiResult<PresignedUrlEntity>> presignedImageUrl({
    required String extension,
    required String productId,
  }) async {
    try {
      final result = await productsApi.presignedUrl(
        id: productId,
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
  Future<ApiResult<ProductEntity>> upsert({
    required ProductUpsertReqEntity req,
  }) async {
    try {
      final categoryId = int.tryParse(req.categoryId?.value ?? '');
      final id = req.id ?? await _nextProductId();
      final image = req.imageUrl?.value?.trim();
      final data = <String, dynamic>{
        'id': id,
        'name': req.name?.value ?? '',
        'title': req.title?.value ?? '',
        'description': req.description?.value ?? '',
        'price': req.price?.value ?? '',
        if (categoryId != null) 'category_id': categoryId,
        // Keep the previous image when the form was saved without picking one.
        if (image != null && image.isNotEmpty) 'image': image,
      };

      await _firestore
          .collection(_productsCollection)
          .doc(id.toString())
          .set(data, SetOptions(merge: true));

      return ApiResult.success(
        data: ProductEntity(
          id: id,
          name: data['name'] as String,
          title: data['title'] as String,
          description: data['description'] as String,
          price: data['price'] as String,
          image: image ?? '',
          category: CategoryEntity(id: categoryId ?? 0),
        ),
      );
    } catch (e, s) {
      return ApiResult.failure(errorInfo: ErrorHandler.handle(e, s));
    }
  }

  /// Products are addressed by their numeric id, so new ones continue the
  /// numbering of the highest id already stored.
  Future<int> _nextProductId() async {
    final latest = await _firestore
        .collection(_productsCollection)
        .orderBy('id', descending: true)
        .limit(1)
        .get();
    final highest = latest.docs.firstOrNull?['id'];
    return (highest is num ? highest.toInt() : 0) + 1;
  }
}
