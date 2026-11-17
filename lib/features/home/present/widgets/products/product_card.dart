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

class ProductCard extends StatelessWidget {
  final ProductEntity product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final imageUrl = resolveStoredImageUrl(product.image);

    return Container(
      clipBehavior: .antiAlias,
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: .circular(14.r),
        border: Border.all(
          color: context.colorScheme.onSurface.withValues(alpha: 0.06),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            offset: const Offset(0, 2),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Expanded(
            child: ProductImage(image: imageUrl),
          ),
          Padding(
            padding: .all(12.r),
            child: Column(
              crossAxisAlignment: .start,
              spacing: 6.h,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        product.title,
                        maxLines: 1,
                        overflow: .ellipsis,
                        style: context.textTheme.titleLarge,
                        textAlign: .right,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    CategoryBadgeWidget(name: product.category.name),
                  ],
                ),
                Text(
                  product.description,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                  textAlign: .right,
                  maxLines: 2,
                  overflow: .ellipsis,
                ),
                Row(
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
