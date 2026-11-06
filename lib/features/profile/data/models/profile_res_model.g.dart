// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileResModel _$ProfileResModelFromJson(Map<String, dynamic> json) =>
    _ProfileResModel(
      id: (json['id'] as num?)?.toInt(),
      avatar: json['avatar'] as String?,
      name: json['name'] as String?,
      username: json['username'] as String?,
      phoneNumber: json['phone_number'] as String?,
      dialCode: json['dial_code'] as String?,
      isoCode: json['iso_code'] as String?,
      email: json['email'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$ProfileResModelToJson(_ProfileResModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'avatar': instance.avatar,
      'name': instance.name,
      'username': instance.username,
      'phone_number': instance.phoneNumber,
      'dial_code': instance.dialCode,
      'iso_code': instance.isoCode,
      'email': instance.email,
      'created_at': instance.createdAt,
    };
