import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../../core/networking/api_constants.dart';
import '../../../products/data/model/product_model.dart';
import '../../../products/data/model/product_upsert_model.dart';
import '../../../profile/data/models/presigned_url_model.dart';
import '../../../profile/data/models/presigned_url_req_model.dart';
import '../model/categories_res_model.dart';
import '../model/category_upsert_model.dart';
part 'categories_api.g.dart';

@singleton
@RestApi()
abstract class CategoriesApi {
  @factoryMethod
  factory CategoriesApi(Dio dio) = _CategoriesApi;
  //! Get
  @GET(ApiConstants.categories)
  Future<List<CategoryModel>> get();
  //! Presigned URL
  @POST('${ApiConstants.products}/id/presigned-url')
  Future<PresignedUrlModel> presignedUrl({
    @Body() required PresignedUrlReqModel presignedUrlReqModel,
  });
  //! Create
  @POST(ApiConstants.products)
  Future<CategoryModel> create(@Body() CategoryUpsertReqModel req);
  //! Update
  @PATCH('${ApiConstants.products}/{id}')
  Future<CategoryModel> update({
    @Path('id') required int id,
    @Body() required CategoryUpsertReqModel req,
  });
}
