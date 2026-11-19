import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
          Expanded(child: ProductImage(image: imageUrl)),
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
                    color: context.colorScheme.onSurface.withValues(alpha: 0.6),
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
            child: _PriceActionBar(
              spacing: 8.w,
              price: PriceWidget(price: product.price),
              action: CustomOutlinedButton(
                text: 'تعديل',
                icon: Icons.edit_outlined,
                onTap: () {
                  context.pushNamed(
                    UpsertProductView.routeName,
                    extra: product,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Lays the price and the action on one line while the price can still shrink
/// with an ellipsis, and moves the action below the price only when the action
/// alone is wider than the bar. Neither a [Row] (it overflows) nor a [Wrap] (it
/// breaks the line too early) can decide that, so the bar measures the action
/// itself.
class _PriceActionBar extends MultiChildRenderObjectWidget {
  _PriceActionBar({
    required Widget price,
    required Widget action,
    required this.spacing,
  }) : super(children: [price, action]);

  /// Gap between the price and the action, and between the two lines.
  final double spacing;

  @override
  _RenderPriceActionBar createRenderObject(BuildContext context) {
    return _RenderPriceActionBar(spacing, Directionality.of(context));
  }

  @override
  void updateRenderObject(
    BuildContext context,
    _RenderPriceActionBar renderObject,
  ) {
    renderObject
      ..spacing = spacing
      ..textDirection = Directionality.of(context);
  }
}

class _PriceActionBarParentData extends ContainerBoxParentData<RenderBox> {}

class _RenderPriceActionBar extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, _PriceActionBarParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, _PriceActionBarParentData> {
  _RenderPriceActionBar(this._spacing, this._textDirection);

  double _spacing;
  set spacing(double value) {
    if (value == _spacing) return;
    _spacing = value;
    markNeedsLayout();
  }

  TextDirection _textDirection;
  set textDirection(TextDirection value) {
    if (value == _textDirection) return;
    _textDirection = value;
    markNeedsLayout();
  }

  @override
  void setupParentData(RenderBox child) {
    if (child.parentData is! _PriceActionBarParentData) {
      child.parentData = _PriceActionBarParentData();
    }
  }

  @override
  void performLayout() {
    final price = firstChild!;
    final action = lastChild!;

    // The action keeps its natural width: it is what decides the layout. It is
    // laid out unbounded so a bar narrower than the action cannot squeeze the
    // button's own contents.
    action.layout(const BoxConstraints(), parentUsesSize: true);
    final priceWidth = constraints.maxWidth - action.size.width - _spacing;
    final stacked = priceWidth <= 0;

    price.layout(
      stacked
          ? constraints.loosen()
          : BoxConstraints(
              maxWidth: priceWidth,
              maxHeight: constraints.maxHeight,
            ),
      parentUsesSize: true,
    );

    final height = stacked
        ? price.size.height + _spacing + action.size.height
        : math.max(price.size.height, action.size.height);
    size = constraints.constrain(Size(constraints.maxWidth, height));

    final priceY = stacked ? 0.0 : (size.height - price.size.height) / 2;
    _position(price, dy: priceY);
    _position(
      action,
      dy: stacked
          ? price.size.height + _spacing
          : (size.height - action.size.height) / 2,
      atEnd: !stacked,
    );
  }

  /// Aligns [child] to the start of the bar when [atEnd] is false, to its end
  /// otherwise, following [textDirection].
  void _position(RenderBox child, {required double dy, bool atEnd = false}) {
    final isRtl = _textDirection == TextDirection.rtl;
    final alignRight = atEnd ? !isRtl : isRtl;
    final dx = alignRight ? math.max(0.0, size.width - child.size.width) : 0.0;
    (child.parentData! as _PriceActionBarParentData).offset = Offset(dx, dy);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    defaultPaint(context, offset);
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    return defaultHitTestChildren(result, position: position);
  }
}
