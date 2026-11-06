import 'package:flutter/material.dart';
import '../../../../core/utils/device_helper.dart';
import '../../domain/entities/product_entity.dart';
import '../../../home/present/widgets/products/product_card.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({super.key, required this.products});
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double crossAxisCount = AppResponsive.responsive(
          context,
          mobile: 1,
          tablet: 3,
          desktop: 4,
        );
        return GridView.builder(
          shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount.toInt(),
            childAspectRatio: 1.025,
          ),
          itemBuilder: (_, i) {
            return ProductCard(product: products[i]);
          },
        );
      },
    );
  }
}
