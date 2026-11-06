import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/errors/models/error_info.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../domain/repo/reset_pass_repo.dart';

@LazySingleton(as: ResetPassRepo)
class ResetPasswordRepositoryImpl implements ResetPassRepo {
  final FirebaseAuth _auth;

  ResetPasswordRepositoryImpl(this._auth);

  @override
  Future<ApiResult<void>> resetPass({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      final user = _auth.currentUser;
      if (user == null) throw Exception("No user logged in");
      if (user.email == null) throw Exception("User email is not available");
      final credential = EmailAuthProvider.credential(
        email: user.email!,
        password: oldPassword,
      );
      await user.reauthenticateWithCredential(credential);
      await user.updatePassword(newPassword);
      return const ApiResult.success(data: null);
    } on FirebaseAuthException catch (e) {
      return ApiResult.failure(
        errorInfo: ErrorInfo(message: e.message ?? 'Failed to reset password'),
      );
    } catch (e) {
      debugPrint('Reset password error: $e');
      return ApiResult.failure(
        errorInfo: ErrorInfo(
          message: 'Failed to reset password. Please try again. Error: $e',
        ),
      );
    }
  }
}
