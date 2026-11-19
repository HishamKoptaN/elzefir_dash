import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/utils/extensions/theme_ext.dart';
import '../../../../core/widgets/feedback/empty_widget.dart';
import '../../../../core/widgets/feedback/error_content_widget.dart';
import '../bloc/notifications_bloc.dart';
import 'widgets/notification_item.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});
  static const String routeName = 'notifications';

  @override
  Widget build(BuildContext context) {
    return NotificationsBody(
      bloc: getIt<NotificationsBloc>(),
    );
  }
}

class NotificationsBody extends StatelessWidget {
  const NotificationsBody({super.key, required this.bloc});

  final NotificationsBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsBloc, NotificationsState>(
      bloc: bloc,
      builder: (context, state) {
        return state.maybeMap(
          loaded: (state) {
            final notifications = state.notifications ?? [];
            final unreadCount = state.unreadCount ?? 0;
            return Column(
              children: [
                Padding(
                  padding: .fromLTRB(16.w, 16.h, 16.w, 8.h),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: .start,
                          spacing: 2.h,
                          children: [
                            Text(
                              'الإشعارات',
                              style: context.textTheme.headlineLarge,
                            ),
                            Text(
                              unreadCount == 0
                                  ? 'كل الإشعارات مقروءة'
                                  : '$unreadCount إشعار غير مقروء',
                              style: context.textTheme.bodyMedium?.copyWith(
                                color: context.colorScheme.onSurface.withValues(
                                  alpha: 0.6,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: TextButton.icon(
                          onPressed: unreadCount == 0
                              ? null
                              : () {
                                  bloc.add(
                                    const NotificationsEvent.markAllAsRead(),
                                  );
                                },
                          icon: const Icon(Icons.done_all_rounded, size: 18),
                          label: const Text(
                            'تحديد الكل كمقروءة',
                            maxLines: 1,
                            overflow: .ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: notifications.isEmpty
                      ? const EmptyWidget(
                          icon: Icons.notifications_none_rounded,
                          text: 'لا توجد إشعارات بعد',
                          hint: 'ستظهر هنا إشعارات التسجيل والطلبات الجديدة لحسابك',
                        )
                      : ListView.separated(
                          padding: .fromLTRB(16.w, 0, 16.w, 24.h),
                          itemCount: notifications.length,
                          separatorBuilder: (_, _) {
                            return Gap(10.h);
                          },
                          itemBuilder: (context, index) {
                            final notification = notifications[index];
                            return NotificationItem(
                              notification: notification,
                              onTap: notification.read
                                  ? null
                                  : () {
                                      bloc.add(
                                        NotificationsEvent.markAsRead(
                                          id: notification.id,
                                        ),
                                      );
                                    },
                            );
                          },
                        ),
                ),
              ],
            );
          },
          failure: (failure) {
            final message = failure.apiErrorModel.message.trim();
            return CustomErrorWidget(
              message: message.isEmpty ? 'تعذّر تحميل الإشعارات' : message,
              onRetry: () {
                bloc.add(const NotificationsEvent.watch());
              },
            );
          },
          initial: (_) {
            bloc.add(const NotificationsEvent.watch());
            return const Center(child: CircularProgressIndicator());
          },
          orElse: () {
            return const Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }
}
