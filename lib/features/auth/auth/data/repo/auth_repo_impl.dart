import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/errors/models/error_info.dart';
import '../../../../../core/globals/database/shared_pref_helper.dart';
import '../../../../../../core/errors/error_handler.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../../../../core/globals/database/shared_pref_keys.dart';
import '../../../../../core/services/auth_storage_service.dart';
import '../../../../../core/services/device_service.dart';
import '../../../../../core/services/token_service.dart';
import '../../../../firebase_messaging/firebase_messaging_service.dart';
import '../../domain/repo/auth_repo.dart';
import '../datasources/auth_api.dart';
import '../models/exchange_token_req_body_model.dart';

@Singleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final FirebaseAuth _fa;
  final AuthApi _api;
  final TokenService _tokenService;
  final AuthStorageService _authStorageService;
  AuthRepoImpl(
    this._fa,
    this._api,
    this._tokenService,
    this._authStorageService,
  );

  @override
  Future<ApiResult<void>> checkFirebase() async {
    if (await SharedPrefHelper.getBool(key: SharedPrefKeys.rememberMe)) {
      try {
        if (_fa.currentUser == null) {
          return ApiResult.failure(errorInfo: ErrorInfo(message: ''));
        }
        return ApiResult.success(data: null);
      } catch (e, st) {
        return ApiResult.failure(errorInfo: ErrorHandler.handle(e, st));
      }
    }
    return signOut();
  }

  @override
  Future<ApiResult<void>> check() async {
    try {
      await _api.check();
      return ApiResult.success(data: null);
    } catch (e, st) {
      return ApiResult.failure(errorInfo: ErrorHandler.handle(e, st));
    }
  }

  @override
  Future<ApiResult<void>> authToken() async {
    try {
      final res = await _api.authToken(
        exchangeToken: ExchangeTokenReqBodyModel(
          idToken: await _tokenService.getIdToken(forceRefresh: true),
          // fcmToken: await FirebaseMessagingService.getFcmToken(),
          device: await DeviceService.getDeviceInfo(),
        ),
      );
      await _authStorageService.storeJwtToken(res.token);
      await _authStorageService.updateAuthToken();
      return const ApiResult.success(data: null);
    } catch (e, st) {
      return ApiResult.failure(errorInfo: ErrorHandler.handle(e, st));
    }
  }

  @override
  Future<ApiResult<void>> signOut() async {
    try {
      await _api.logout();
      await SharedPrefHelper.clearAllSecuredData();
      await SharedPrefHelper.clearAllData();
      return const ApiResult.success(data: null);
    } catch (e, st) {
      return ApiResult.failure(errorInfo: ErrorHandler.handle(e, st));
    }
  }

  @override
  Future<ApiResult<void>> firebaseSignOut() async {
    try {
      await _fa.signOut();
      return const ApiResult.success(data: null);
    } catch (e, st) {
      return ApiResult.failure(errorInfo: ErrorHandler.handle(e, st));
    }
  }
}
