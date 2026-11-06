import '../model/home_res_model.dart';

abstract interface class HomeDataSrc {
  Future<HomeResModel> get();
}
