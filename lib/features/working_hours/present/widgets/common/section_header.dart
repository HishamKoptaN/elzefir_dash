import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/extensions/theme_ext.dart';

/// ترويسة قسم: أيقونة داخل مربع ملون + عنوان وعبارة فرعية اختيارية،
/// مع عنصر اختياري في الطرف المقابل.
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    required this.icon,
    this.subtitle,
    this.tint,
    this.trailing,
  });

  final String title;
  final FaIconData icon;
  final String? subtitle;
  final Color? tint;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final tintColor = tint ?? scheme.primary;
    final subtitle = this.subtitle;
    final trailingWidget = trailing;
    return Row(
      children: [
        Container(
          width: 40.r,
          height: 40.r,
          decoration: BoxDecoration(
            color: tintColor.withValues(alpha: 0.12),
            borderRadius: .circular(12.r),
          ),
          child: Center(
            child: FaIcon(icon, size: 18.r, color: tintColor),
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Column(
            crossAxisAlignment: .start,
            spacing: 2.h,
            children: [
              Text(
                title,
                maxLines: 1,
                overflow: .ellipsis,
                style: context.textTheme.titleMedium,
              ),
              if (subtitle != null)
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: .ellipsis,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: scheme.onSurface.withValues(alpha: 0.55),
                  ),
                ),
            ],
          ),
        ),
        if (trailingWidget != null) Flexible(child: trailingWidget),
      ],
    );
  }
}
