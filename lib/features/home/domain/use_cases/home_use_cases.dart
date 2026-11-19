import 'package:injectable/injectable.dart';

import '../../data/repo/home_repo.dart';

@singleton
class HomeUseCases {
  final HomeRepo homeRepo;
  HomeUseCases({required this.homeRepo});
}
