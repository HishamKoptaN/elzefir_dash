import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/data/models/device_model.dart';

part 'sign_up_req_model.freezed.dart';
part 'sign_up_req_model.g.dart';

@freezed
abstract class SignUpReqModel with _$SignUpReqModel {
  const factory SignUpReqModel({
    required String name,
    required String username,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @JsonKey(name: 'dial_code') String? dialCode,
    @JsonKey(name: 'iso_code') String? isoCode,
    @JsonKey(name: 'id_token') required String idToken,
    @JsonKey(name: 'fcm_token') String? fcmToken,
    DeviceModel? device,
  }) = _SignUpReqModel;
  factory SignUpReqModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpReqModelFromJson(json);
}
