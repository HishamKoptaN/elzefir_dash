import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/device_helper.dart';
import '../../domain/entities/product_entity.dart';
import '../../../home/present/widgets/products/product_card.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({
    super.key,
    required this.products,
    this.shrinkWrap = false,
  });
  final List<ProductEntity> products;
  final bool shrinkWrap;

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = AppResponsive.responsive(
      context,
      mobile: 1,
      tablet: 2,
      desktop: 3,
    );
    return GridView.builder(
      shrinkWrap: shrinkWrap,
      physics: shrinkWrap ? const NeverScrollableScrollPhysics() : null,
      padding: .fromLTRB(16.w, 8.h, 16.w, 24.h),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount.toInt(),
        // Slightly taller than wide so the description and price fit without
        // overflowing.
        childAspectRatio: 0.8,
        mainAxisSpacing: 16.h,
        crossAxisSpacing: 16.w,
      ),
      itemBuilder: (_, i) {
        return ProductCard(product: products[i]);
      },
    );
  }
}