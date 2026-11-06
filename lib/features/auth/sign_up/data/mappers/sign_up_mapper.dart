import '../../../../../core/data/models/device_model.dart';
import '../../domain/entities/sign_up_res_entity.dart';
import '../../domain/entities/sign_up_req_entity.dart';
import '../models/sign_up_req_model.dart';
import '../models/sign_up_res_model.dart';

extension SignUpReqMapper on SignUpReqEntity {
  SignUpReqModel toModel({
    required String idToken,
    String? fcmToken,
    DeviceModel? device,
  }) {
    return SignUpReqModel(
      name: name?.value ?? '',
      username: username?.value ?? '',
      phoneNumber: phoneNumber?.value ?? '',
      dialCode: dialCode?.value ?? '',
      isoCode: isoCode?.value ?? '',
      idToken: idToken,
      fcmToken: fcmToken,
      device: device,
    );
  }
}

extension SignUpResMapper on SignUpResModel {
  SignUpResEntity toEntity() {
    return SignUpResEntity(token: token!);
  }
}
