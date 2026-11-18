import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/extensions/theme_ext.dart';
import '../../../../../core/utils/storage_url.dart';
import '../../../../products/domain/entities/product_entity.dart';
import '../../../../products/present/view/upsert_product_view.dart';
import '../editing_btn.dart';
import 'category_badge_widget.dart';
import 'product_image.dart';

import 'price_widget.dart';

/// كارت منتج بأسلوب Stitch: صورة في الأعلى، شارة التصنيف بامتداد كامل،
/// ثم وصف مختصر، وشريط سفلي يفصل السعر وزر «تعديل» عن بقية المحتوى.
class ProductCard extends StatelessWidget {
  final ProductEntity product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final imageUrl = resolveStoredImageUrl(product.image);

    return Container(
      clipBehavior: .antiAlias,
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: .circular(16.r),
        border: Border.all(color: context.colorScheme.outline),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.primary.withValues(alpha: 0.05),
            offset: const Offset(0, 2),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: .stretch,
        children: [
          Expanded(
            child: ProductImage(image: imageUrl),
          ),
          Padding(
            padding: .fromLTRB(12.w, 10.h, 12.w, 8.h),
            child: Column(
              crossAxisAlignment: .start,
              spacing: 6.h,
              children: [
                CategoryBadgeWidget(name: product.category.name),
                Text(
                  product.title,
                  maxLines: 1,
                  overflow: .ellipsis,
                  style: context.textTheme.titleMedium,
                  textAlign: .right,
                ),
                Text(
                  product.description,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.colorScheme.onSurface.withValues(
                      alpha: 0.6,
                    ),
                  ),
                  textAlign: .right,
                  maxLines: 2,
                  overflow: .ellipsis,
                ),
              ],
            ),
          ),
          Container(
            padding: .symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: context.colorScheme.outline),
              ),
            ),
            child: Row(
              children: [
                Expanded(child: PriceWidget(price: product.price)),
                CustomOutlinedButton(
                  text: 'تعديل',
                  icon: Icons.edit_outlined,
                  onTap: () {
                    context.pushNamed(
                      UpsertProductView.routeName,
                      extra: product,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
