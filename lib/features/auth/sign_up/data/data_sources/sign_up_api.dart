import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../models/sign_up_req_model.dart';
import '../models/sign_up_res_model.dart';

part 'sign_up_api.g.dart';

@lazySingleton
@RestApi()
abstract class SignUpApi {
  @factoryMethod
  factory SignUpApi(@Named("authDio") Dio dio) = _SignUpApi;
  @POST('sign-up')
  Future<SignUpResModel> signUp(@Body() SignUpReqModel signUpReq);
}
