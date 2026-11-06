// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PackageEntity _$PackageEntityFromJson(Map<String, dynamic> json) =>
    _PackageEntity(
      id: (json['id'] as num?)?.toInt(),
      type: json['type'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PackageEntityToJson(_PackageEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'quantity': instance.quantity,
    };
