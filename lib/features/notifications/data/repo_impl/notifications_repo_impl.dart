import 'package:injectable/injectable.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../core/errors/models/error_info.dart';
import '../../domain/entities/notification_entity.dart';
import '../../domain/repo/notifications_repo.dart';
import '../datasources/notifications_api.dart';
import '../mappers/notification_mapper.dart';
import 'package:rxdart/rxdart.dart';

@Singleton(as: NotificationsRepo)
class NotificationsRepoImpl implements NotificationsRepo {
  final NotificationsApi api;
  NotificationsRepoImpl(this.api);
  final _nots$ = BehaviorSubject<List<NotificationEntity>>.seeded([]);

  @override
  Stream<List<NotificationEntity>> watch() {
    return _nots$.stream;
  }

  @override
  Future<void> saveNotification({
    required NotificationEntity notification,
  }) async {
    _nots$.add([..._nots$.value, notification]);
  }

  @override
  Future<ApiResult<void>> getNotifications() async {
    try {
      final res = await api.get();
      final fetched = res.notifications?.map((e) {
            return e.toEntity();
          }) ??
          [];
      // Refresh replaces instead of appends, so repeated watch()
      // dispatches never duplicate the list.
      final seen = <String>{};
      final merged = <NotificationEntity>[];
      for (final item in [..._nots$.value, ...fetched]) {
        if (seen.add(item.id)) {
          merged.add(item);
        }
      }
      _nots$.add(merged);
      return ApiResult.success(data: null);
    } catch (error) {
      return const ApiResult.failure(errorInfo: ErrorInfo());
    }
  }

  @override
  Future<ApiResult<void>> markAsRead({required String id}) async {
    final List<NotificationEntity> currentList = _nots$.value;
    final updatedList = currentList.map((notif) {
      if (notif.id == id) {
        return notif.copyWith(read: true);
      }
      return notif;
    }).toList();
    _nots$.add(updatedList);
    return ApiResult.success(data: null);
  }

  @override
  Future<ApiResult<void>> markAllAsRead() async {
    final updatedList = _nots$.value.map((notif) {
      return notif.copyWith(read: true);
    }).toList();
    _nots$.add(updatedList);
    return const ApiResult.success(data: null);
  }
}
