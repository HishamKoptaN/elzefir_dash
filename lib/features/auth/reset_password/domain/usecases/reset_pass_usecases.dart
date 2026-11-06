import 'package:injectable/injectable.dart';

import '../../../../../../core/networking/api_result.dart';
import '../repo/reset_pass_repo.dart';

@lazySingleton
class ResetPassUseCases {
  final ResetPassRepo repo;
  ResetPassUseCases(this.repo);
  Future<ApiResult<void>> resetPass({
    required String oldPassword,
    required String newPassword,
  }) async {
    return await repo.resetPass(
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
  }
}
