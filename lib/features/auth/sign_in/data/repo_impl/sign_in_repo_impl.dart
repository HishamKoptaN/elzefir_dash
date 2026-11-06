import 'package:injectable/injectable.dart';
import '../../../../../core/errors/error_handler.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../../../../core/globals/database/shared_pref_helper.dart';
import '../../../../../core/globals/database/shared_pref_keys.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/di/dio/api_module.dart';
import '../../../auth/domain/repo/auth_repo.dart';
import '../../../sign_up/data/services/firebase_auth_service.dart';
import '../../domain/entities/sign_in_req_entity.dart';
import '../../domain/repo/sign_in_repo.dart';
import '../datasources/sign_in_api.dart';
import '../models/email_res_model.dart';

@LazySingleton(as: SignInRepo)
class SignInRepoImpl implements SignInRepo {
  final FirebaseAuthService _firebaseAuthService;
  final AuthRepo authRepo;
  final SignInApi _api;
  SignInRepoImpl(this._firebaseAuthService, this.authRepo, this._api);

  @override
  Future<ApiResult<void>> signIn({required SignInReqEntity signIn}) async {
    try {
      await _firebaseAuthService.signIn(
        email: signIn.email?.value ?? '',
        pass: signIn.password?.value ?? '',
      );
      await SharedPrefHelper.setData(
        key: SharedPrefKeys.rememberMe,
        value: signIn.rememberMe,
      );
      await getIt<AuthInterceptor>().updateToken();
      return ApiResult.success(data: null);
    } catch (e, s) {
      return ApiResult.failure(errorInfo: ErrorHandler.handle(e, s));
    }
  }

  @override
  Future<ApiResult<EmailResModel>> getEmail({required String username}) async {
    try {
      final res = await _api.getEmail(username: username);
      return ApiResult.success(data: res);
    } catch (e, s) {
      return ApiResult.failure(errorInfo: ErrorHandler.handle(e, s));
    }
  }
}
