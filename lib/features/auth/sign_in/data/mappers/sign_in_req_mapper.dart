import '../../domain/entities/sign_in_req_entity.dart';
import '../../../auth/data/models/exchange_token_req_body_model.dart';

extension SignInReqMapper on SignInReqEntity {
  ExchangeTokenReqBodyModel toModel({required String idToken}) =>
      ExchangeTokenReqBodyModel(idToken: idToken);
}
