import 'package:alzefr_dash/features/categories/domain/entities/categories_res_entity.dart';
import 'package:alzefr_dash/features/home/present/widgets/editing_btn.dart';
import 'package:alzefr_dash/features/home/present/widgets/products/product_card.dart';
import 'package:alzefr_dash/features/home/present/widgets/products/price_widget.dart';
import 'package:alzefr_dash/features/products/domain/entities/product_entity.dart';
import 'package:alzefr_dash/features/products/present/view/products_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'dashboard_test_app.dart';

void main() {
  // A long title, description and price keep the card under pressure: the
  // price and the edit button share the bar.
  const product = ProductEntity(
    id: 1,
    name: 'بوري',
    title: 'بوري مشوي على الفحم مع أرز صيادية',
    description:
        'طبق عائلي من سمك البوري الطازج المشوي مع أرز صيادية وصلصة طحينة.',
    price: '1,250.50',
    category: CategoryEntity(id: 7, name: 'أسماك مشوية بالكيلو'),
  );

  // Phones at the reported width, a phone with large text, and the three column
  // desktop with large text: none of them may push the button onto a second
  // line.
  for (final (screen, textScale) in [
    (const Size(320, 690), 1.0),
    (const Size(360, 690), 2.0),
    (const Size(1440, 900), 2.0),
  ]) {
    testWidgets('product card bar stays on one line at ${screen.width} wide, '
        'scale $textScale', (tester) async {
      // The grid sizes the card, so it is pumped like the products page does.
      await pumpDashboard(
        tester,
        const ProductsWidget(products: [product]),
        size: screen,
        textScale: textScale,
      );

      final price = tester.getRect(find.byType(PriceWidget));
      final button = tester.getRect(find.byType(CustomOutlinedButton));

      // The price shrinks instead of pushing the button down a line.
      expect((button.center.dy - price.center.dy).abs(), lessThan(1));
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('product card bar stacks the button when the bar is narrower', (
    tester,
  ) async {
    // 200 wide leaves the bar less room than the button needs on its own.
    await pumpDashboard(
      tester,
      Center(
        child: SizedBox(
          width: 200,
          height: 600,
          child: const ProductCard(product: product),
        ),
      ),
    );

    final price = tester.getRect(find.byType(PriceWidget));
    final button = tester.getRect(find.byType(CustomOutlinedButton));

    expect(button.top, greaterThanOrEqualTo(price.bottom));
    expect(tester.takeException(), isNull);
  });
}
