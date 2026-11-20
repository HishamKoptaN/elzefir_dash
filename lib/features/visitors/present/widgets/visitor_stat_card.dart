import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/extensions/theme_ext.dart';

class VisitorStatCard extends StatelessWidget {
  const VisitorStatCard({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: .all(16.r),
        decoration: BoxDecoration(
          color: context.colorScheme.surfaceContainer,
          borderRadius: .circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Icon(icon, color: context.colorScheme.primary, size: 22.r),
            SizedBox(height: 8.h),
            Text(
              value,
              style: context.textTheme.headlineSmall?.copyWith(
                color: context.colorScheme.primary,
              ),
            ),
            Text(label, style: context.textTheme.labelMedium),
          ],
        ),
      ),
    );
  }
}
