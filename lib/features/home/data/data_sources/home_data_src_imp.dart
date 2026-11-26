import 'package:injectable/injectable.dart';

import 'home_api.dart';
import 'home_data_src.dart';

@Singleton(as: HomeDataSrc)
class HomeDataSrcImpl implements HomeDataSrc {
  final HomeApi api;
  HomeDataSrcImpl({required this.api});
}
