import 'package:alzefr_dash/features/products/data/mapper/products_mapper.dart';
import 'package:alzefr_dash/features/products/domain/entities/product_entity.dart';
import 'package:alzefr_dash/features/profile/domain/entities/presigned_url_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/error_handler.dart';
import '../../../../core/errors/models/error_info.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/services/numeric_id_allocator.dart';
import '../../../../core/services/presigned_image_uploader.dart';
import '../../../../core/utils/price_input.dart';
import '../../../categories/domain/entities/categories_res_entity.dart';
import '../../../profile/data/mappers/profile_model_mapper.dart';
import '../../../profile/data/models/presigned_url_req_model.dart';
import '../../domain/entities/product_upsert_req_entity.dart';
import '../../domain/repo/products_repo.dart';
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
        return ProductModel.fromJson(
          normalizeProductJson(doc.data()),
        ).toEntity();
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
      // A product carries a single price; validate and normalize it here so an
      // invalid price can never be written from any entry point.
      final price = parsePriceNumber(req.price?.value ?? '');
      if (price == null) {
        return ApiResult.failure(
          errorInfo: const ErrorInfo(message: 'أدخل سعرًا رقميًا صالحًا'),
        );
      }

      final categoryId = int.tryParse(req.categoryId?.value ?? '');
      final image = req.imageUrl?.value.trim() ?? '';
      final products = _firestore.collection(_productsCollection);
      final name = req.name?.value ?? '';
      final title = req.title?.value ?? '';
      final description = req.description?.value ?? '';

      // Only new products need an id; an existing one keeps the id it has.
      final idStart = req.id == null ? await numericIdStartAfter(products) : 1;
      late final int id;
      await _firestore.runTransaction((transaction) async {
        // Claiming the id and writing the document in the same transaction
        // keeps two concurrent saves from taking the same product id.
        id =
            req.id ??
            await reserveNumericId(transaction, products, startFrom: idStart);
        transaction.set(
          products.doc(id.toString()),
          {
            'id': id,
            'name': name,
            'title': title,
            'description': description,
            'price': price,
            if (categoryId != null) 'category_id': categoryId,
            // Keep the previous image when the form was saved without picking one.
            if (image.isNotEmpty) 'image': image,
            'price_updated_at': FieldValue.serverTimestamp(),
          },
          SetOptions(merge: true),
        );
      });

      return ApiResult.success(
        data: ProductEntity(
          id: id,
          name: name,
          title: title,
          description: description,
          price: priceToText(price),
          image: image,
          category: CategoryEntity(id: categoryId ?? 0),
        ),
      );
    } catch (e, s) {
      return ApiResult.failure(errorInfo: ErrorHandler.handle(e, s));
    }
  }

  @override
  Future<ApiResult<void>> delete(int id) async {
    try {
      await _firestore.collection(_productsCollection).doc(id.toString()).delete();
      return const ApiResult.success(data: null);
    } catch (e, s) {
      return ApiResult.failure(errorInfo: ErrorHandler.handle(e, s));
    }
  }
}
