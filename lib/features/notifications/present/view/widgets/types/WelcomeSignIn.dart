import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../domain/entities/notification_entity.dart';

class WelcomeNotification extends StatelessWidget {
  const WelcomeNotification({
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
    final unread = !notification.read;
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: unread
              ? colorScheme.primaryContainer.withValues(alpha: .35)
              : colorScheme.surface,
          border: Border.all(
            color: unread
                ? colorScheme.primary.withValues(alpha: .25)
                : colorScheme.outline.withValues(alpha: .08),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 58.w,
              height: 58.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    colorScheme.primary,
                    colorScheme.primary.withValues(alpha: .75),
                  ],
                ),
              ),
              child: Icon(
                Icons.waving_hand_rounded,
                color: colorScheme.onPrimary,
                size: 28.sp,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          notification.title,
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                      if (unread)
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: colorScheme.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    notification.body,
                    style: textTheme.bodyMedium?.copyWith(
                      fontSize: 15.sp,
                      height: 1.6,
                      color: colorScheme.onSurface.withValues(alpha: .8),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerHighest,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.favorite_rounded,
                          color: Colors.red,
                          size: 18.sp,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'نتمنى لك تجربة ممتعة داخل التطبيق 💙',
                            style: textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: FilledButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_rounded),
                      iconAlignment: IconAlignment.end,
                      label: const Text('ابدأ الآن'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
