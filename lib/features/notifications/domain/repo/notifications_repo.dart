import '../../../../core/networking/api_result.dart';
import '../entities/notification_entity.dart';

abstract class NotificationsRepo {
  Stream<List<NotificationEntity>> watch();
  Future<void> saveNotification({required NotificationEntity notification});
  Future<ApiResult<void>> getNotifications();
  Future<ApiResult<void>> markAsRead({required String id});
}
