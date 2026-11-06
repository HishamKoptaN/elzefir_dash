import '../../../../../../core/networking/api_result.dart';
import '../../data/models/email_res_model.dart';
import '../entities/sign_in_req_entity.dart';

abstract class SignInRepo {
  Future<ApiResult<void>> signIn({required SignInReqEntity signIn});
  Future<ApiResult<EmailResModel>> getEmail({required String username});
}
