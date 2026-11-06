import 'package:freezed_annotation/freezed_annotation.dart';
part 'update_profile_req_model.freezed.dart';
part 'update_profile_req_model.g.dart';

@freezed
abstract class UpdateProfileReqModel with _$UpdateProfileReqModel {
  const factory UpdateProfileReqModel({
    String? avatar,
    String? name,
    String? username,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @JsonKey(name: 'dial_code') String? dialCode,
    @JsonKey(name: 'iso_code') String? isoCode,
  }) = _UpdateProfileReqModel;
  factory UpdateProfileReqModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileReqModelFromJson(json);
}
