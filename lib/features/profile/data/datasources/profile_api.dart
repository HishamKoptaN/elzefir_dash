import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/networking/api_constants.dart';
import '../models/presigned_url_model.dart';
import '../models/presigned_url_req_model.dart';
import '../models/profile_res_model.dart';
import '../models/update_profile_req_model.dart';

part 'profile_api.g.dart';

@lazySingleton
@RestApi()
abstract class ProfileApi {
  @factoryMethod
  factory ProfileApi(Dio dio) = _ProfileApi;
  @GET(ApiConstants.profile)
  Future<ProfileResModel> getProfile();
  @POST(ApiConstants.profile)
  Future<PresignedUrlModel> presignedAvatarUrl({
    @Body() required PresignedUrlReqModel presignedUrlReqModel,
  });
  @PUT(ApiConstants.profile)
  Future<ProfileResModel> updateProfile({
    @Body() required UpdateProfileReqModel updateProfileReqModel,
  });
}
