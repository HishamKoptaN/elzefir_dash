import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:alzefr_dash/core/utils/extensions/theme_ext.dart';

class CategoriesHeader extends StatelessWidget {
  const CategoriesHeader({super.key, required this.count, required this.onAdd});

  final int count;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .fromLTRB(16.w, 16.h, 16.w, 8.h),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              spacing: 2.h,
              children: [
                Text('التصنيفات', style: context.textTheme.headlineLarge),
                Text(
                  count == 0
                      ? 'لا توجد تصنيفات بعد'
                      : '$count تصنيف لتنظيم المنيو',
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: context.colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),
          FilledButton.icon(
            onPressed: onAdd,
            icon: const Icon(Icons.add),
            label: const Text('إضافة تصنيف'),
          ),
        ],
      ),
    );
  }
}