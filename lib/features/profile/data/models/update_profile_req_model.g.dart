// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_req_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateProfileReqModel _$UpdateProfileReqModelFromJson(
  Map<String, dynamic> json,
) => _UpdateProfileReqModel(
  avatar: json['avatar'] as String?,
  name: json['name'] as String?,
  username: json['username'] as String?,
  phoneNumber: json['phone_number'] as String?,
  dialCode: json['dial_code'] as String?,
  isoCode: json['iso_code'] as String?,
);

Map<String, dynamic> _$UpdateProfileReqModelToJson(
  _UpdateProfileReqModel instance,
) => <String, dynamic>{
  'avatar': instance.avatar,
  'name': instance.name,
  'username': instance.username,
  'phone_number': instance.phoneNumber,
  'dial_code': instance.dialCode,
  'iso_code': instance.isoCode,
};
