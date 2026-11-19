import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/extensions/theme_ext.dart';

/// عنوان الشاشة ووصفها التوضيحي.
class WorkingHoursHeader extends StatelessWidget {
  const WorkingHoursHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 6.h,
      children: [
        Text('ساعات العمل', style: context.textTheme.headlineLarge),
        Text(
          'حدّد أيام العمل ووقت الفتح والإغلاق، وستظهر هذه الإعدادات في صفحة المطعم.',
          style: context.textTheme.bodyLarge?.copyWith(
            color: context.colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }
}
