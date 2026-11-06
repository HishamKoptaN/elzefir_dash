import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../../core/networking/api_constants.dart';
import '../model/home_res_model.dart';
part 'home_api.g.dart';

@singleton
@RestApi()
abstract class HomeApi {
  @factoryMethod
  factory HomeApi(Dio dio) = _HomeApi;
  //! Get
  @GET(ApiConstants.home)
  Future<HomeResModel> get();
}
