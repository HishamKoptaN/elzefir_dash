import 'dart:async';

import 'package:injectable/injectable.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../auth/present/blocs/auth_bloc/auth_bloc.dart';
import '../entities/sign_up_req_entity.dart';
import '../repo/sign_up_repo.dart';

@lazySingleton
class SignUpUseCases {
  final SignUpRepo repo;

  SignUpUseCases(this.repo);
  Future<ApiResult<void>> signUp({required SignUpReqEntity signUpReq}) async {
    final res = await repo.signUp(signUpReq: signUpReq);
    return res.when(
      success: (_) async {
        final completer = Completer<void>();
        getIt<AuthBloc>().add(AuthEvent.authToken(onComplete: completer));
        await completer.future;
        return ApiResult.success(data: null);
      },
      failure: (apiErrorModel) async {
        return ApiResult.failure(errorInfo: apiErrorModel);
      },
    );
  }
}
