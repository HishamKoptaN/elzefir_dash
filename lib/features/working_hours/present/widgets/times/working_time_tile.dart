import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/extensions/theme_ext.dart';

/// مربع وقت قابل للنقر (فتح أو إغلاق) بأسلوب Stitch:
/// أيقونة في مربع ملون + تسمية صغيرة + الوقت بحجم كبير + زر تعديل في الزاوية.
class WorkingTimeTile extends StatelessWidget {
  const WorkingTimeTile({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    required this.tint,
    required this.suffix,
    required this.onTap,
  });

  final String label;
  final String value;
  final FaIconData icon;
  final Color tint;
  final String suffix;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final radius = BorderRadius.circular(16.r);
    return Material(
      color: scheme.surfaceContainerLow,
      borderRadius: radius,
      child: InkWell(
        onTap: onTap,
        borderRadius: radius,
        child: Padding(
          padding: .all(12.r),
          child: Column(
            crossAxisAlignment: .start,
            spacing: 10.h,
            children: [
              Row(
                children: [
                  Container(
                    width: 32.r,
                    height: 32.r,
                    decoration: BoxDecoration(
                      color: tint.withValues(alpha: 0.15),
                      borderRadius: .circular(10.r),
                    ),
                    child: Center(
                      child: FaIcon(icon, size: 16.r, color: tint),
                    ),
                  ),
                  const Spacer(),
                  FaIcon(
                    FontAwesomeIcons.pen,
                    size: 13.r,
                    color: scheme.onSurface.withValues(alpha: 0.35),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: .start,
                spacing: 2.h,
                children: [
                  Text(
                    label,
                    style: context.textTheme.labelMedium?.copyWith(
                      color: scheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: .baseline,
                    textBaseline: .alphabetic,
                    children: [
                      Text(
                        value,
                        style: context.textTheme.headlineSmall?.copyWith(
                          color: scheme.primary,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        suffix,
                        style: context.textTheme.labelMedium?.copyWith(
                          color: scheme.onSurface.withValues(alpha: 0.6),
                        ),
                      ),
                    ],
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
