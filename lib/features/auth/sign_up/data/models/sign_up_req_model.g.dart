// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_req_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SignUpReqModel _$SignUpReqModelFromJson(Map<String, dynamic> json) =>
    _SignUpReqModel(
      name: json['name'] as String,
      username: json['username'] as String,
      phoneNumber: json['phone_number'] as String?,
      dialCode: json['dial_code'] as String?,
      isoCode: json['iso_code'] as String?,
      idToken: json['id_token'] as String,
      fcmToken: json['fcm_token'] as String?,
      device: json['device'] == null
          ? null
          : DeviceModel.fromJson(json['device'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignUpReqModelToJson(_SignUpReqModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'phone_number': instance.phoneNumber,
      'dial_code': instance.dialCode,
      'iso_code': instance.isoCode,
      'id_token': instance.idToken,
      'fcm_token': instance.fcmToken,
      'device': instance.device,
    };
