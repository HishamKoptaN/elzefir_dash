// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationsResModel _$NotificationsResModelFromJson(
  Map<String, dynamic> json,
) => _NotificationsResModel(
  notifications: (json['data'] as List<dynamic>?)
      ?.map((e) => NotificationModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  meta: json['meta'] == null
      ? null
      : MetaModel.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$NotificationsResModelToJson(
  _NotificationsResModel instance,
) => <String, dynamic>{'data': instance.notifications, 'meta': instance.meta};

_NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    _NotificationModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      body: json['body'] as String?,
      data: json['data'] as Map<String, dynamic>? ?? const <String, dynamic>{},
      type: json['type'] as String?,
      readAt: json['read_at'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$NotificationModelToJson(_NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'data': instance.data,
      'type': instance.type,
      'read_at': instance.readAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
