import 'package:injectable/injectable.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../../../../core/errors/error_handler.dart';
import '../../domain/entities/sign_up_req_entity.dart';
import '../../domain/repo/sign_up_repo.dart';
import '../services/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/globals/database/shared_pref_helper.dart';
import '../../../../../core/globals/database/shared_pref_keys.dart';
import '../../../../../../core/di/dio/api_module.dart';
import '../../../../../../core/di/dependency_injection.dart';
import '../../../../../../core/services/token_service.dart';
import '../../../../../core/services/device_service.dart';
import '../../../../firebase_messaging/firebase_messaging_service.dart';
import '../data_sources/sign_up_api.dart';
import '../mappers/sign_up_mapper.dart';

@LazySingleton(as: SignUpRepo)
class SignUpRepoImpl implements SignUpRepo {
  final TokenService _tokenService;
  final FirebaseAuthService _firebaseAuthService;
  final SignUpApi _api;
  SignUpRepoImpl(this._tokenService, this._firebaseAuthService, this._api);
  @override
  Future<ApiResult<void>> signUp({required SignUpReqEntity signUpReq}) async {
    UserCredential? userCredential;
    try {
      userCredential = await _authenticateUser(signUpReq: signUpReq);
      await _integrateWithBackend(signUpReq, await _tokenService.getIdToken());

      return const ApiResult.success(data: null);
    } catch (e, s) {
      cleanupFirebaseUser(userCredential);
      return ApiResult.failure(errorInfo: ErrorHandler.handle(e, s));
    }
  }

  Future<UserCredential> _authenticateUser({
    required SignUpReqEntity signUpReq,
  }) async {
    return await _firebaseAuthService.createUser(
      email: signUpReq.email!.value,
      password: signUpReq.password!.value,
      displayName: signUpReq.name!.value,
    );
  }

  Future<void> _integrateWithBackend(
    SignUpReqEntity signUpReqEntity,
    String idToken,
  ) async {
    final res = await _api.signUp(
      signUpReqEntity.toModel(
        idToken: idToken,
        // fcmToken: await FirebaseMessagingService.getFcmToken(),
        device: await DeviceService.getDeviceInfo(),
      ),
    );
    await SharedPrefHelper.setSecuredString(
      key: SharedPrefKeys.jwtToken,
      value: res.token!,
    );
    await getIt<AuthInterceptor>().updateToken();
    await SharedPrefHelper.setData(
      key: SharedPrefKeys.rememberMe,
      value: signUpReqEntity.rememberMe ?? false,
    );
  }

  Future<void> cleanupFirebaseUser(UserCredential? userCredential) async {
    await _firebaseAuthService.deleteUser(userCredential);
  }
}
