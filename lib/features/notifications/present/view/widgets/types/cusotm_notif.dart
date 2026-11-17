import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../domain/entities/notification_entity.dart';

class NewUserRegistered extends StatelessWidget {
  const NewUserRegistered({
    super.key,
    required this.notification,
    required this.colorScheme,
    required this.textTheme,
  });

  final NotificationEntity notification;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: notification.read
            ? Theme.of(context).colorScheme.surface
            : Theme.of(context).colorScheme.primary.withValues(alpha: 0.05),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notification.title,
                      style: textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          TextSpan(
                            text: "قام ",
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextSpan(
                            text: '${notification.body} ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: "بتسجيل حساباً جديداً ."),
                        ],
                      ),
                    ),
                    const SizedBox(height: 7),
                    SizedBox(
                      height: 50.h,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          enabledMouseCursor: SystemMouseCursors.click,
                          disabledMouseCursor: SystemMouseCursors.forbidden,
                        ),
                        onPressed: () async {
                          // if (await canLaunchUrl(
                          //   Uri.parse(
                          //     '${EnvConfig.config.dashboardUrl}/dashboard/users/${notification.data!['id']!}',
                          //   ),
                          // )) {
                          //   await launchUrl(
                          //     Uri.parse(
                          //       '${EnvConfig.config.dashboardUrl}/dashboard/users/${notification.data!['id']!}',
                          //     ),
                          //     mode: LaunchMode.platformDefault,
                          //   );
                          // }
                        },
                        icon: const Icon(Icons.open_in_new, size: 12),
                        iconAlignment: .end,
                        label: Text(
                          'مراجعة وتعيين الصلاحية',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    // Text(
                    //   notification.createdAt,
                    //   style: textTheme.bodyMedium?.copyWith(
                    //     color: colorScheme.onSurface.withValues(alpha: 0.6),
                    //     fontSize: 18.sp,
                    //   ),
                    //   textAlign: TextAlign.right,
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
