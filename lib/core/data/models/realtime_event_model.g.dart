// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realtime_event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RealtimeEventModel _$RealtimeEventModelFromJson(Map<String, dynamic> json) =>
    _RealtimeEventModel(
      id: (json['id'] as num?)?.toInt(),
      orderNum: json['order_num'] as String?,
      name: json['name'] as String?,
      status: json['status'] as bool?,
      totalAmount: json['total_amount'] as String?,
      countryCode: json['country_code'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      package: json['package'] == null
          ? null
          : PackageModel.fromJson(json['package'] as Map<String, dynamic>),
      distributionCountry: json['distribution_country'] == null
          ? null
          : DistributionCountry.fromJson(
              json['distribution_country'] as Map<String, dynamic>,
            ),
      changes: json['changes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$RealtimeEventModelToJson(_RealtimeEventModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_num': instance.orderNum,
      'name': instance.name,
      'status': instance.status,
      'total_amount': instance.totalAmount,
      'country_code': instance.countryCode,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'package': instance.package,
      'distribution_country': instance.distributionCountry,
      'changes': instance.changes,
    };

_PackageModel _$PackageModelFromJson(Map<String, dynamic> json) =>
    _PackageModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$PackageModelToJson(_PackageModel instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_DistributionCountry _$DistributionCountryFromJson(Map<String, dynamic> json) =>
    _DistributionCountry(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$DistributionCountryToJson(
  _DistributionCountry instance,
) => <String, dynamic>{'id': instance.id, 'name': instance.name};
