import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/models/error_info.dart';
import '../../domain/entities/notification_entity.dart';
import '../../domain/usecases/notifications_use_cases.dart';
part 'notifications_bloc.freezed.dart';
part 'notifications_event.dart';
part 'notifications_state.dart';

@singleton
class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final NotificationsUseCases useCases;

  /// يمنع فتح أكثر من اشتراك واحد على البث نفسه عند تكرار حدث `watch`.
  bool _watching = false;

  NotificationsBloc(this.useCases) : super(const NotificationsState.initial()) {
    on<NotificationsEvent>((event, emit) async {
      await event.when(
        watch: () async {
          if (_watching) {
            return;
          }
          _watching = true;
          try {
            await useCases.getNotifications();
          } catch (e) {
            emit(
              NotificationsState.failure(
                apiErrorModel: ErrorInfo(message: e.toString()),
              ),
            );
          }
          await emit.forEach<List<NotificationEntity>>(
            useCases.watch(),
            onData: (notifications) {
              return NotificationsState.loaded(
                notifications: notifications,
                unreadCount: notifications.where((n) {
                  return !n.read;
                }).length,
              );
            },
            onError: (error, stackTrace) {
              return NotificationsState.failure(
                apiErrorModel: ErrorInfo(message: error.toString()),
              );
            },
          );
          _watching = false;
        },
        markAsRead: (id) async {
          await useCases.markAsRead(id: id);
        },
        markAllAsRead: () async {
          await useCases.markAllAsRead();
        },
      );
    },
        // watch() stays subscribed forever, so every event type must process
        // concurrently — otherwise markAsRead queues behind the never-ending
        // watch handler and never runs.
        transformer: concurrent());
  }
}
