import 'package:alzefr_dash/core/di/dependency_injection.dart';
import 'package:alzefr_dash/core/errors/models/error_info.dart';
import 'package:alzefr_dash/core/networking/api_result.dart';
import 'package:alzefr_dash/features/categories/domain/entities/categories_res_entity.dart';
import 'package:alzefr_dash/features/categories/present/blocs/bloc/categories_bloc.dart';
import 'package:alzefr_dash/features/products/domain/entities/product_entity.dart';
import 'package:alzefr_dash/features/products/present/blocs/bloc/products_bloc.dart';
import 'package:alzefr_dash/features/products/present/view/products_view.dart';
import 'package:alzefr_dash/features/products/present/view/products_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../support/fake_use_cases.dart';
import 'dashboard_test_app.dart';

void main() {
  const product = ProductEntity(
    id: 1,
    name: 'بوري',
    title: 'مشوي',
    price: '130',
    category: CategoryEntity(id: 7),
  );
  const soup = ProductEntity(
    id: 2,
    name: 'Soup',
    title: 'شوربة',
    price: '50',
    category: CategoryEntity(id: 8, name: 'مقبلات'),
  );

  late FakeCategoriesUseCases categories;

  /// Opens the products route on its own — no home route is pumped, so nothing
  /// else in the tree could have asked for the categories. The blocs are built
  /// here (not in `setUp`) so their async work runs in the tester's fake-async
  /// zone.
  Future<void> openRoute(
    WidgetTester tester, {
    required ApiResult<List<CategoryEntity>> categoriesResult,
    required ApiResult<List<ProductEntity>> productsResult,
  }) async {
    categories = FakeCategoriesUseCases()..result.complete(categoriesResult);
    final products = FakeProductsUseCases()..result.complete(productsResult);
    final categoriesBloc = CategoriesBloc(categoriesUseCases: categories);
    final productsBloc = ProductsBloc(useCases: products);
    getIt.registerSingleton<CategoriesBloc>(categoriesBloc);
    getIt.registerSingleton<ProductsBloc>(productsBloc);
    addTearDown(() async {
      await categoriesBloc.close();
      await productsBloc.close();
      await getIt.reset();
    });
    await pumpDashboard(tester, const ProductsView());
  }

  testWidgets('opening products directly resolves category names for search', (
    tester,
  ) async {
    await openRoute(
      tester,
      categoriesResult: const ApiResult.success(
        data: [CategoryEntity(id: 7, name: 'مشويات')],
      ),
      productsResult: const ApiResult.success(data: [product]),
    );

    expect(categories.getCalls, 1);

    await tester.enterText(find.byType(TextField), 'مشويات');
    await tester.pumpAndSettle();

    final shown = tester
        .widget<ProductsWidget>(find.byType(ProductsWidget))
        .products;
    expect(shown.single.category.name, 'مشويات');
    expect(tester.takeException(), isNull);
  });

  testWidgets(
    'a categories failure keeps the list and searches by name/title',
    (tester) async {
      await openRoute(
        tester,
        categoriesResult: const ApiResult.failure(
          errorInfo: ErrorInfo(message: 'تعذّر تحميل التصنيفات'),
        ),
        productsResult: const ApiResult.success(data: [product, soup]),
      );

      final list = find.byType(ProductsWidget);
      expect(tester.widget<ProductsWidget>(list).products, hasLength(2));

      for (final entry in {'بوري': 1, 'مشوي': 1}.entries) {
        await tester.enterText(find.byType(TextField), entry.key);
        await tester.pumpAndSettle();
        final shown = tester.widget<ProductsWidget>(list).products;
        expect(shown.single.id, entry.value, reason: 'query: ${entry.key}');
      }
      expect(tester.takeException(), isNull);
    },
  );
}
