import 'dart:async';
import 'package:injectable/injectable.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../auth/present/blocs/auth_bloc/auth_bloc.dart';
import '../entities/IdentityInput.dart';
import '../entities/sign_in_req_entity.dart';
import '../repo/sign_in_repo.dart';

@lazySingleton
class SignInUseCases {
  final SignInRepo _repo;
  SignInUseCases(this._repo);
  Future<ApiResult<void>> signIn({required SignInReqEntity signIn}) async {
    final String identity = signIn.email!.value.trim();
    bool isEmail = identity.contains('@');
    String? emailToUse;
    if (isEmail) {
      emailToUse = identity;
    } else {
      final res = await _repo.getEmail(username: identity);
      res.mapOrNull(
        success: (emailRes) {
          emailToUse = emailRes.data?.email ?? '';
        },
        failure: (errorInfo) {
          return errorInfo;
        },
      );
    }
    final res = await _repo.signIn(
      signIn: signIn.copyWith(email: IdentityInput.dirty(emailToUse ?? '')),
    );
    return res.when(
      success: (_) async {
        final completer = Completer<void>();
        getIt<AuthBloc>().add(AuthEvent.authToken(onComplete: completer));
        await completer.future;
        return ApiResult.success(data: null);
      },
      failure: (errorInfo) async {
        return ApiResult.failure(errorInfo: errorInfo);
      },
    );
  }
}
