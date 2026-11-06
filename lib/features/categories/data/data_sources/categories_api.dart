import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../../core/networking/api_constants.dart';
import '../../../profile/data/models/presigned_url_model.dart';
import '../../../profile/data/models/presigned_url_req_model.dart';
part 'categories_api.g.dart';

@singleton
@RestApi()
abstract class CategoriesApi {
  @factoryMethod
  factory CategoriesApi(Dio dio) = _CategoriesApi;

  //! Presigned URL: asks the backend for an upload link for the category image
  @POST('${ApiConstants.categories}/{id}/presigned-url')
  Future<PresignedUrlModel> presignedUrl({
    @Path('id') required String id,
    @Body() required PresignedUrlReqModel presignedUrlReqModel,
  });
}
