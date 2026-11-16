// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settlement_method_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SettlementMethodModel _$SettlementMethodModelFromJson(
  Map<String, dynamic> json,
) => _SettlementMethodModel(
  id: json['id'] as String?,
  name: json['name'] as String?,
  title: json['title'] as String?,
  enabled: json['enabled'] as bool?,
);

Map<String, dynamic> _$SettlementMethodModelToJson(
  _SettlementMethodModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'title': instance.title,
  'enabled': instance.enabled,
};
