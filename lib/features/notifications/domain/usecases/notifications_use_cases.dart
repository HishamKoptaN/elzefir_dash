import 'package:injectable/injectable.dart';

import '../../../../../core/networking/api_result.dart';
import '../entities/notification_entity.dart';
import '../repo/notifications_repo.dart';

@singleton
class NotificationsUseCases {
  final NotificationsRepo notificationsRepo;
  NotificationsUseCases(this.notificationsRepo);
  Stream<List<NotificationEntity>> watch() {
    return notificationsRepo.watch();
  }

  Future<ApiResult<void>> getNotifications() async {
    return await notificationsRepo.getNotifications();
  }

  Future<void> saveNotification({required NotificationEntity notification}) {
    return notificationsRepo.saveNotification(notification: notification);
  }

  Future<ApiResult<void>> markAsRead({required String id}) async {
    return await notificationsRepo.markAsRead(id: id);
  }
}
