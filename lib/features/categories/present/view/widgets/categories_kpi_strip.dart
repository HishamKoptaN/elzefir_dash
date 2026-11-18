import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/extensions/theme_ext.dart';
import '../../../domain/entities/categories_res_entity.dart';

/// شريط موجز بثلاث بطاقات: إجمالي التصنيفات، عددها بصور، وعددها بدون
/// صورة — كلها محسوبة من القائمة المحملة، بلا أرقام وهمية.
class CategoriesKpiStrip extends StatelessWidget {
  const CategoriesKpiStrip({super.key, required this.categories});

  final List<CategoryEntity> categories;

  @override
  Widget build(BuildContext context) {
    final withImage = categories
        .where((category) => category.image.trim().isNotEmpty)
        .length;
    final withoutImage = categories.length - withImage;
    return Padding(
      padding: .fromLTRB(16.w, 4.h, 16.w, 8.h),
      child: Row(
        children: [
          Expanded(
            child: _KpiCard(
              icon: Icons.grid_view_rounded,
              tint: context.colorScheme.primary,
              label: 'إجمالي التصنيفات',
              value: '${categories.length}',
              unit: 'قسم',
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: _KpiCard(
              icon: Icons.image_rounded,
              tint: context.colorScheme.secondary,
              label: 'بصور',
              value: '$withImage',
              unit: 'تصنيف',
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: _KpiCard(
              icon: Icons.image_not_supported_outlined,
              tint: context.colorScheme.tertiary,
              label: 'بدون صورة',
              value: '$withoutImage',
              unit: 'تصنيف',
            ),
          ),
        ],
      ),
    );
  }
}

class _KpiCard extends StatelessWidget {
  const _KpiCard({
    required this.icon,
    required this.tint,
    required this.label,
    required this.value,
    required this.unit,
  });

  final IconData icon;
  final Color tint;
  final String label;
  final String value;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(12.r),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: .circular(16.r),
        border: Border.all(color: context.colorScheme.outline),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.primary.withValues(alpha: 0.05),
            offset: const Offset(0, 2),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: .start,
        spacing: 8.h,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: .ellipsis,
                  style: context.textTheme.labelMedium?.copyWith(
                    color: context.colorScheme.onSurface.withValues(
                      alpha: 0.6,
                    ),
                  ),
                ),
              ),
              Container(
                width: 28.r,
                height: 28.r,
                decoration: BoxDecoration(
                  color: tint.withValues(alpha: 0.12),
                  borderRadius: .circular(8.r),
                ),
                child: Icon(icon, size: 16.r, color: tint),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: .baseline,
            textBaseline: .alphabetic,
            children: [
              Flexible(
                child: Text(
                  value,
                  maxLines: 1,
                  overflow: .ellipsis,
                  style: context.textTheme.titleLarge?.copyWith(
                    color: context.colorScheme.onSurface,
                  ),
                ),
              ),
              SizedBox(width: 4.w),
              Text(
                unit,
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
