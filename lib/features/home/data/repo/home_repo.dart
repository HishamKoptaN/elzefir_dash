import '../../../../../../core/networking/api_result.dart';
import '../../domain/entities/home_res_entity.dart';

abstract class HomeRepo {
  Future<ApiResult<HomeResEntity>> get();
}
