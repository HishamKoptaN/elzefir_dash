import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/models/error_info.dart';
import '../../../../core/networking/api_result.dart';
import '../../domain/entities/notification_entity.dart';
import '../../domain/usecases/notifications_use_cases.dart';
part 'notifications_bloc.freezed.dart';
part 'notifications_event.dart';
part 'notifications_state.dart';

@singleton
class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final NotificationsUseCases useCases;
  StreamSubscription<List<NotificationEntity>>? _notsSub;

  NotificationsBloc(this.useCases) : super(NotificationsState.initial()) {
    on<NotificationsEvent>((event, emit) async {
      await event.when(
        watch: () async {
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
        },
        markAsRead: (id) async {
          // final idx = _notifications.indexWhere((n) => n.id == id);
          // if (idx != -1) {
          //   final updated = _notifications[idx].copyWith(read: true);
          //   _notifications[idx] = updated;
          //   emit(
          //     NotificationsState.loaded(
          //       notifications: _notifications,
          //       hasMore: _hasMore,
          //     ),
          //   );
          // }
          // final res = await useCases.markAsRead(id: id);
          // await res.when(
          //   success: (_) async {},
          //   failure: (apiErrorModel) async {
          //     // revert if failed
          //     if (idx != -1) {
          //       _notifications[idx] =
          //           _notifications[idx].copyWith(read: false);
          //       emit(NotificationsState.loaded(
          //         notifications: _notifications,
          //         hasMore: _hasMore,
          //       ),);
          //     }
          //   },
          // );
        },
      );
    });
  }

  @override
  Future<void> close() {
    _notsSub?.cancel();
    return super.close();
  }
}
