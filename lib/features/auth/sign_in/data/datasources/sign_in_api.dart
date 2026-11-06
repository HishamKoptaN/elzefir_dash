import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../models/email_res_model.dart';
part 'sign_in_api.g.dart';

@lazySingleton
@RestApi()
abstract class SignInApi {
  @factoryMethod
  factory SignInApi(@Named("authDio") Dio dio) = _SignInApi;

  @GET('email')
  Future<EmailResModel> getEmail({@Query('username') required String username});
}
