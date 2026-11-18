import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/extensions/theme_ext.dart';
import '../../../../../categories/domain/entities/categories_res_entity.dart';
import '../../../../domain/entities/product_entity.dart';

/// رقائق تصنيف أفقية للتمرير، تفلتر الشبكة المعروضة: «الكل» + كل تصنيف
/// عليه منتجات، مع عدّاده. النقر على التصنيف المحدد يلغيه ويعيد «الكل».
class ProductsCategoryFilter extends StatelessWidget {
  const ProductsCategoryFilter({
    super.key,
    required this.products,
    required this.categories,
    required this.selectedId,
    required this.onSelected,
  });

  final List<ProductEntity> products;
  final List<CategoryEntity> categories;
  final int? selectedId;
  final ValueChanged<int?> onSelected;

  @override
  Widget build(BuildContext context) {
    final counts = <int, int>{};
    for (final product in products) {
      final id = product.category.id;
      counts[id] = (counts[id] ?? 0) + 1;
    }
    final active = [
      for (final category in categories)
        if ((counts[category.id] ?? 0) > 0) category,
    ];
    if (active.isEmpty) {
      return const SizedBox.shrink();
    }
    return SizedBox(
      height: 44.h,
      child: ListView(
        scrollDirection: .horizontal,
        padding: .symmetric(horizontal: 16.w),
        children: [
          _Chip(
            label: 'الكل (${products.length})',
            selected: selectedId == null,
            onTap: () {
              return onSelected(null);
            },
          ),
          for (final category in active)
            ...[
              SizedBox(width: 8.w),
              _Chip(
                label: '${category.name} (${counts[category.id]})',
                selected: selectedId == category.id,
                onTap: () {
                  return onSelected(
                    selectedId == category.id ? null : category.id,
                  );
                },
              ),
            ],
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    return Material(
      color: selected ? scheme.primary : scheme.surface,
      borderRadius: .circular(999),
      child: InkWell(
        onTap: onTap,
        borderRadius: .circular(999),
        child: Container(
          padding: .symmetric(horizontal: 14.w, vertical: 8.h),
          decoration: BoxDecoration(
            borderRadius: .circular(999),
            border: Border.all(
              color: selected ? scheme.primary : scheme.outline,
            ),
          ),
          child: Center(
            child: Text(
              label,
              style: context.textTheme.labelMedium?.copyWith(
                color: selected
                    ? scheme.onPrimary
                    : scheme.onSurface.withValues(alpha: 0.8),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
