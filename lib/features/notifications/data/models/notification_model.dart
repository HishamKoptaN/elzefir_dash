import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/data/models/meta.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
abstract class NotificationsResModel with _$NotificationsResModel {
  const factory NotificationsResModel({
    @JsonKey(name: 'data') List<NotificationModel>? notifications,
    @JsonKey(name: 'meta') MetaModel? meta,
  }) = _NotificationsResModel;
  factory NotificationsResModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationsResModelFromJson(json);
}

@freezed
abstract class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'body') String? body,
    @Default(<String, dynamic>{}) Map<String, dynamic> data,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'read_at') String? readAt,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, Object?> json) =>
      _$NotificationModelFromJson(json);
}
