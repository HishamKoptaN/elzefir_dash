import 'package:injectable/injectable.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../data/repo/home_repo.dart';
import '../entities/home_res_entity.dart';

@singleton
class HomeUseCases {
  final HomeRepo homeRepo;
  HomeUseCases({required this.homeRepo});
  Future<ApiResult<HomeResEntity>> get() async {
    return await homeRepo.get();
  }
}
