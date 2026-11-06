part of 'notifications_bloc.dart';

@freezed
abstract class NotificationsEvent with _$NotificationsEvent {
  const factory NotificationsEvent.watch() = _Watch;
  const factory NotificationsEvent.markAsRead({required String id}) =
      _MarkAsRead;
}
