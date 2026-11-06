import '../../../../core/data/entities/meta_entity.dart';
import '../../../../core/data/mapper/meta_mapper.dart';
import '../../../../core/utils/date/date_formatter.dart';
import '../../domain/entities/notification_entity.dart';
import '../models/notification_model.dart';

extension NotificationsResMapper on NotificationsResModel {
  NotificationsResEntity toEntity() {
    return NotificationsResEntity(
      notifications:
          notifications?.map((e) {
            return e.toEntity();
          }).toList() ??
          [],
      meta: meta?.toEntity() ?? MetaEntity(),
    );
  }
}

extension NotificationModelMapper on NotificationModel {
  NotificationEntity toEntity() {
    return NotificationEntity(
      id: id.toString(),
      title: title ?? '',
      body: body ?? '',
      type: NotificationType.fromString(type: type ?? ''),
      data: data,
      createdAt: formatDate(dateTime: createdAt ?? ''),
    );
  }
}
