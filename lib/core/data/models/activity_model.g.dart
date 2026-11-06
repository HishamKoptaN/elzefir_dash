// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ActivityModel _$ActivityModelFromJson(Map<String, dynamic> json) =>
    _ActivityModel(
      type: json['type'] as String?,
      action: json['action'] as String?,
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      data: json['data'] as Map<String, dynamic>?,
      timestamp: json['timestamp'] as String?,
      createdAt: json['created_at'] as String?,
      icon: json['icon'] as String?,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$ActivityModelToJson(_ActivityModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'action': instance.action,
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'data': instance.data,
      'timestamp': instance.timestamp,
      'created_at': instance.createdAt,
      'icon': instance.icon,
      'color': instance.color,
    };
