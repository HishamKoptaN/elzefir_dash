import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_currency.dart';
import '../../../../../../core/utils/extensions/theme_ext.dart';
import '../../../../../../core/utils/format_currency.dart';
import '../../../../../../core/utils/price_input.dart';
import '../../../../domain/entities/product_entity.dart';

/// شريط موجز بثلاث بطاقات إحصائية أعلى شاشة المنتجات:
/// إجمالي المنتجات، عدد التصنيفات، ومتوسط السعر — كلها محسوبة من بيانات
/// حقيقية محمّلة، بلا أرقام وهمية.
class ProductsKpiStrip extends StatelessWidget {
  const ProductsKpiStrip({
    super.key,
    required this.products,
    required this.categoryCount,
  });

  final List<ProductEntity> products;
  final int categoryCount;

  String get _averagePriceLabel {
    final prices = products
        .map((product) => parsePrice(product.price))
        .whereType<double>()
        .toList();
    if (prices.isEmpty) {
      return '—';
    }
    final average =
        prices.reduce((sum, price) => sum + price) / prices.length;
    return formatCurrency(value: average.toStringAsFixed(2));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .fromLTRB(16.w, 4.h, 16.w, 8.h),
      child: Row(
        children: [
          Expanded(
            child: _KpiCard(
              icon: Icons.inventory_2_outlined,
              tint: context.colorScheme.primary,
              label: 'إجمالي المنتجات',
              value: '${products.length}',
              unit: 'منتج',
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: _KpiCard(
              icon: Icons.grid_view_rounded,
              tint: context.colorScheme.secondary,
              label: 'التصنيفات',
              value: '$categoryCount',
              unit: 'تصنيف',
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: _KpiCard(
              icon: Icons.payments_outlined,
              tint: context.colorScheme.tertiary,
              label: 'متوسط السعر',
              value: _averagePriceLabel,
              unit: appCurrency,
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
