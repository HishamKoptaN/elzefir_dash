import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/networking/api_constants.dart';
import '../../../profile/data/models/presigned_url_model.dart';
import '../../../profile/data/models/presigned_url_req_model.dart';

part 'products_api.g.dart';

@lazySingleton
@RestApi()
abstract class ProductsApi {
  @factoryMethod
  factory ProductsApi(Dio dio) = _ProductsApi;

  //! Presigned URL: asks the backend for an upload link for this product image
  @POST('${ApiConstants.products}/{id}/presigned-url')
  Future<PresignedUrlModel> presignedUrl({
    @Path('id') required String id,
    @Body() required PresignedUrlReqModel presignedUrlReqModel,
  });
}
