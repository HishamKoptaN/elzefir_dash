import 'package:alzefr_dash/features/categories/domain/entities/categories_res_entity.dart';
import 'package:alzefr_dash/features/products/domain/entities/product_entity.dart';
import 'package:alzefr_dash/features/products/present/view/products_widget.dart';
import 'package:alzefr_dash/features/products/present/view/widgets/list/products_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'dashboard_test_app.dart';

void main() {
  const products = [
    ProductEntity(
      id: 1,
      name: 'بوري',
      title: 'مشوي',
      price: '130',
      category: CategoryEntity(id: 7),
    ),
    ProductEntity(
      id: 2,
      name: 'Soup',
      title: 'شوربة',
      price: '50',
      category: CategoryEntity(id: 8, name: 'مقبلات'),
    ),
  ];
  const categories = [CategoryEntity(id: 7, name: 'مشويات')];

  testWidgets('search resolves asynchronously loaded categories and clears', (
    tester,
  ) async {
    Widget content(List<CategoryEntity> categories) {
      return ProductsContent(
        products: products,
        categories: categories,
        onAdd: () {},
      );
    }

    await pumpDashboard(tester, content([]));
    await tester.enterText(find.byType(TextField), 'مشويات');
    await tester.pumpAndSettle();
    expect(find.text('لا توجد نتائج لبحثك'), findsOneWidget);
    await pumpDashboard(tester, content(categories));
    expect(
      tester
          .widget<ProductsWidget>(find.byType(ProductsWidget))
          .products
          .single
          .category
          .name,
      'مشويات',
    );
    for (final entry in {
      'بوري': 1,
      ' soup ': 2,
      'مقبلات': 2,
      'مشوي': 1,
    }.entries) {
      await tester.enterText(find.byType(TextField), entry.key);
      await tester.pumpAndSettle();
      expect(
        tester
            .widget<ProductsWidget>(find.byType(ProductsWidget))
            .products
            .single
            .id,
        entry.value,
      );
    }
    await tester.enterText(find.byType(TextField), 'غير موجود');
    await tester.pumpAndSettle();
    expect(find.text('لا توجد نتائج لبحثك'), findsOneWidget);
    expect(find.byType(ProductsWidget), findsNothing);
    await tester.tap(find.byTooltip('مسح البحث'));
    await tester.pumpAndSettle();
    expect(
      tester
          .widget<ProductsWidget>(find.byType(ProductsWidget))
          .products
          .length,
      2,
    );
    expect(find.byTooltip('مسح البحث'), findsNothing);
    expect(tester.takeException(), isNull);
  });
}
