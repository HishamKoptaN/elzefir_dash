import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/widgets/navigation/custom_app_bar.dart';
import '../../domain/entities/notification_entity.dart';
import '../../domain/repo/notifications_repo.dart';
import '../bloc/notifications_bloc.dart';
import 'widgets/notification_item.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});
  static const String routeName = 'notifications';
  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'الإشعارات'),
      body: Container(
        color: const Color(0xFFFFFFFF),
        width: double.infinity,
        height: double.infinity,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF7F7F7),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                BlocBuilder<NotificationsBloc, NotificationsState>(
                  bloc: getIt<NotificationsBloc>(),
                  builder: (context, state) {
                    return state.maybeMap(
                      loaded: (state) {
                        return ListView.separated(
                          shrinkWrap: true,
                          itemCount: state.notifications?.length ?? 0,
                          itemBuilder: (context, i) {
                            return NotificationItem(
                              notification: state.notifications![i],
                            );
                          },
                          separatorBuilder: (context, i) {
                            return Gap(10.h);
                          },
                        );
                      },
                      initial: (state) {
                        getIt<NotificationsBloc>().add(
                          const NotificationsEvent.watch(),
                        );
                        return const SizedBox.shrink();
                      },
                      orElse: () {
                        return const SizedBox();
                      },
                    );
                  },
                ),
                // ...sectionsToShow.entries.expand(
                //   (entry) => [
                //     _SectionLabel(text: entry.key),
                //     _NotificationsCard(items: entry.value),
                //     const SizedBox(height: 16),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationItem({required NotificationEntity notification}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      color: notification.read ? Colors.white : const Color(0xFFE8EAF6),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25.r,
            backgroundColor: Colors.grey[200],
            child: Icon(Icons.notifications, color: Colors.blueAccent),
          ),
          Gap(12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style: TextStyle(
                    fontWeight: notification.read
                        ? FontWeight.normal
                        : FontWeight.bold,
                  ),
                ),
                Text(
                  notification.body,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
