import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/extensions/theme_ext.dart';

/// مربع وقت قابل للنقر (فتح أو إغلاق).
class WorkingTimeTile extends StatelessWidget {
  const WorkingTimeTile({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final String value;
  final FaIconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final BorderRadius radius = .circular(16.r);
    return Material(
      color: scheme.primary.withValues(alpha: 0.04),
      borderRadius: radius,
      child: InkWell(
        onTap: onTap,
        borderRadius: radius,
        child: Container(
          padding: .all(12.r),
          decoration: BoxDecoration(
            borderRadius: radius,
            border: Border.all(
              color: scheme.primary.withValues(alpha: 0.12),
            ),
          ),
          child: Column(
            crossAxisAlignment: .start,
            spacing: 10.h,
            children: [
              Row(
                spacing: 6.w,
                children: [
                  FaIcon(icon, size: 15.r, color: scheme.primary),
                  Expanded(
                    child: Text(
                      label,
                      style: context.textTheme.labelMedium?.copyWith(
                        color: scheme.onSurface.withValues(alpha: 0.65),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      value,
                      style: context.textTheme.headlineSmall?.copyWith(
                        color: scheme.primary,
                      ),
                    ),
                  ),
                  FaIcon(
                    FontAwesomeIcons.pen,
                    size: 13.r,
                    color: scheme.onSurface.withValues(alpha: 0.35),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
