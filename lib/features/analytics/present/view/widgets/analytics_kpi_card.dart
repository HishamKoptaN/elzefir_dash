import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/utils/extensions/theme_ext.dart';

class AnalyticsKpiCard extends StatelessWidget {
  const AnalyticsKpiCard({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final FaIconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: .all(16.r),
        child: Row(
          spacing: 12.w,
          children: [
            Container(
              padding: .all(12.r),
              decoration: BoxDecoration(
                color: context.colorScheme.primary.withValues(alpha: 0.1),
                borderRadius: .circular(12.r),
              ),
              child: FaIcon(
                icon,
                size: 22.r,
                color: context.colorScheme.primary,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                spacing: 4.h,
                children: [
                  Text(
                    value,
                    style: context.textTheme.headlineSmall?.copyWith(
                      color: context.colorScheme.primary,
                    ),
                  ),
                  Text(
                    label,
                    maxLines: 1,
                    overflow: .ellipsis,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colorScheme.onSurface.withValues(
                        alpha: 0.65,
                      ),
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
