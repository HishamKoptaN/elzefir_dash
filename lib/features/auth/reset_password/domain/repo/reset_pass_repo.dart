import '../../../../../../core/networking/api_result.dart';

abstract class ResetPassRepo {
  Future<ApiResult<void>> resetPass({
    required String oldPassword,
    required String newPassword,
  });
}
