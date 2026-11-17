import 'package:injectable/injectable.dart';

import '../../data/data_sources/home_data_src.dart';
import '../../data/repo/home_repo.dart';

@Singleton(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  final HomeDataSrc homeDataSrc;
  HomeRepoImpl(this.homeDataSrc);
}
