import 'package:alzefr_dash/core/routing/utils/navigation_service.dart';
import 'package:alzefr_dash/features/products/present/view/upsert_product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/extensions/responsive_icon_extension .dart';
import '../../../../../core/utils/extensions/theme_ext.dart';
import '../../../../../core/widgets/custom_image.dart';
import '../../../../products/domain/entities/product_entity.dart';
import '../../../../products/present/view/products_view.dart';
import '../editing_btn.dart';
import 'category_badge_widget.dart';

class ProductCard extends StatefulWidget {
  final ProductEntity product;
  const ProductCard({super.key, required this.product});
  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 900.w,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: .circular(12.r),
        border: Border.all(
          color: const Color(0xFFC3C7CE).withValues(alpha: 0.1),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            offset: Offset(0, 1),
            blurRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          GestureDetector(
            onTap: () {
              showGeneralDialog(
                context: context,
                barrierDismissible: true,
                barrierLabel: "Close",
                barrierColor: Colors.black87,
                pageBuilder: (_, _, _) {
                  return Center(
                    child: GestureDetector(
                      onTap: () {},
                      child: InteractiveViewer(
                        minScale: 1,
                        maxScale: 4,
                        child: CustomImage(
                          image: widget.product.image,
                          fit: .contain,
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            child: Container(
              padding: .all(6.sp),
              decoration: BoxDecoration(
                color: Color(0xFFFFF1EA),
                borderRadius: .vertical(top: Radius.circular(12.r)),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    child: SizedBox(
                      height: 170.h,
                      width: .infinity,
                      child: CustomImage(
                        image: widget.product.image,
                        fit: .cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 12.h,
                    right: 10.w,
                    child: Container(
                      padding: .all(8.w),
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: .circular(20.r),
                      ),
                      child: Icon(
                        Icons.zoom_in,
                        size: 14.iconRes,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: .all(16.r),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.product.title,
                        maxLines: 2,
                        style: context.textTheme.titleLarge?.copyWith(
                          color: Color(0xFF28180D),
                        ),
                        textAlign: .right,
                      ),
                    ),
                    CategoryBadgeWidget(name: widget.product.category.name),
                  ],
                ),
                SizedBox(height: 4.h),
                SizedBox(
                  width: .infinity,
                  child: Text(
                    widget.product.description,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: Color(0xFF42474D),
                    ),
                    textAlign: .right,
                    maxLines: 2,
                    overflow: .ellipsis,
                  ),
                ),
                PriceWidget(price: widget.product.price),
                Align(
                  alignment: Alignment.center,
                  child: CustomOutlinedButton(
                    text: 'تعديل',
                    onTap: () {
                      context.pushNamed(
                        UpsertProductView.routeName,
                        extra: widget.product,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color accentColorCalc(Color baseColor) {
    return const Color(0xFFF7E2D5);
  }
}

class PriceWidget extends StatelessWidget {
  const PriceWidget({super.key, required this.price});

  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .end,
      children: [
        Text(
          price,
          style: context.textTheme.titleLarge?.copyWith(
            color: Color(0xFF001629),
          ),
        ),
        SizedBox(width: 4.w),
        Text(
          'ج.م',
          style: context.textTheme.titleMedium?.copyWith(
            color: Color(0xFF001629),
          ),
          // style: TextStyle(
          //   color: Color(0xFF42474D),
          // ),
        ),
      ],
    );
  }
}
