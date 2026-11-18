import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../../core/utils/extensions/theme_ext.dart';
import '../../../domain/entities/notification_entity.dart';

/// كارت إشعار موحّد بأسلوب لوحة التحكم: دائرة أيقونة ملونة حسب النوع،
/// عنوان، جسم مختصر، الوقت، ونقطة كحلية للإشعار غير المقروء.
class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.notification, this.onTap});

  final NotificationEntity notification;
  final VoidCallback? onTap;

  static (IconData icon, Color tint) _iconFor(NotificationType type, ColorScheme scheme) {
    return switch (type) {
      NotificationType.newUserRegistered => (
        Icons.person_add_alt_1_rounded,
        scheme.primary,
      ),
      NotificationType.newOrder => (Icons.shopping_bag_outlined, scheme.secondary),
      NotificationType.orderUpdated => (Icons.receipt_long_outlined, scheme.tertiary),
      _ => (Icons.notifications_none_rounded, scheme.onSurface),
    };
  }

  String? _formatTime(String raw) {
    final date = DateTime.tryParse(raw);
    if (date == null) {
      return null;
    }
    return DateFormat('dd/MM/yyyy · HH:mm').format(date.toLocal());
  }

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final textTheme = context.textTheme;
    final unread = !notification.read;
    final (icon, tint) = _iconFor(notification.type, scheme);
    final time = _formatTime(notification.createdAt);

    return Material(
      color: unread
          ? scheme.primary.withValues(alpha: 0.05)
          : scheme.surface,
      borderRadius: .circular(16.r),
      child: InkWell(
        onTap: onTap,
        borderRadius: .circular(16.r),
        child: Container(
          padding: .all(12.r),
          decoration: BoxDecoration(
            borderRadius: .circular(16.r),
            border: Border.all(
              color: unread ? scheme.primary.withValues(alpha: 0.25) : scheme.outline,
            ),
            boxShadow: [
              BoxShadow(
                color: scheme.primary.withValues(alpha: 0.04),
                offset: const Offset(0, 2),
                blurRadius: 8,
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: .start,
            children: [
              Container(
                width: 44.r,
                height: 44.r,
                decoration: BoxDecoration(
                  color: tint.withValues(alpha: 0.12),
                  borderRadius: .circular(12.r),
                ),
                child: Icon(icon, size: 22.r, color: tint),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  spacing: 2.h,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            notification.title,
                            maxLines: 1,
                            overflow: .ellipsis,
                            style: textTheme.titleSmall?.copyWith(
                              color: scheme.onSurface,
                              fontWeight: unread ? .w700 : .w500,
                            ),
                          ),
                        ),
                        if (unread)
                          Container(
                            width: 8.r,
                            height: 8.r,
                            decoration: BoxDecoration(
                              color: scheme.primary,
                              shape: .circle,
                            ),
                          ),
                      ],
                    ),
                    Text(
                      notification.body,
                      maxLines: 2,
                      overflow: .ellipsis,
                      style: textTheme.bodyMedium?.copyWith(
                        color: scheme.onSurface.withValues(alpha: 0.65),
                      ),
                    ),
                    if (time != null)
                      Text(
                        time,
                        style: textTheme.labelSmall?.copyWith(
                          color: scheme.onSurface.withValues(alpha: 0.5),
                        ),
                      ),
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
