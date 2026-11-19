import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/extensions/theme_ext.dart';

class CategoryBadgeWidget extends StatelessWidget {
  final String name;
  const CategoryBadgeWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 10.w),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        name,
        maxLines: 1,
        overflow: .ellipsis,
        style: context.textTheme.titleSmall?.copyWith(
          color: context.colorScheme.onSurface.withValues(alpha: 0.7),
        ),
      ),
    );
  }
}
