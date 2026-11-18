import 'dart:async';

import 'package:alzefr_dash/core/di/dependency_injection.dart';
import 'package:alzefr_dash/core/networking/api_result.dart';
import 'package:alzefr_dash/features/categories/domain/entities/categories_res_entity.dart';
import 'package:alzefr_dash/features/categories/domain/use_cases/categories_use_cases.dart';
import 'package:alzefr_dash/features/categories/present/blocs/bloc/categories_bloc.dart';
import 'package:alzefr_dash/features/products/domain/entities/product_entity.dart';
import 'package:alzefr_dash/features/products/domain/use_cases/products_use_cases.dart';
import 'package:alzefr_dash/features/products/present/blocs/bloc/products_bloc.dart';
import 'package:alzefr_dash/features/products/present/view/products_view.dart';
import 'package:alzefr_dash/features/products/present/view/products_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'dashboard_test_app.dart';

void main() {
  const product = ProductEntity(
    id: 1,
    name: 'بوري',
    title: 'مشوي',
    price: '130',
    category: CategoryEntity(id: 7),
  );

  testWidgets(
    'opening products directly loads categories so search matches category names',
    (tester) async {
      final categories = _CategoriesUseCases();
      final products = _ProductsUseCase();
      final categoriesBloc = CategoriesBloc(categoriesUseCases: categories);
      final productsBloc = ProductsBloc(useCases: products);
      getIt.registerSingleton<CategoriesBloc>(categoriesBloc);
      getIt.registerSingleton<ProductsBloc>(productsBloc);
      addTearDown(() async {
        await categoriesBloc.close();
        await productsBloc.close();
        await getIt.reset();
      });

      // The products route alone: no home route was ever pumped, so nothing
      // else in the tree could have requested the categories.
      await pumpDashboard(tester, const ProductsView(), settle: false);
      await tester.pump();

      expect(categories.getCalls, 1);

      products.result.complete(
        const ApiResult<List<ProductEntity>>.success(data: [product]),
      );
      await tester.pumpAndSettle();
      expect(find.byType(ProductsWidget), findsOneWidget);
      expect(
        tester
            .widget<ProductsWidget>(find.byType(ProductsWidget))
            .products
            .single
            .category
            .name,
        '',
      );

      await tester.enterText(find.byType(TextField), 'مشويات');
      await tester.pumpAndSettle();
      expect(find.text('لا توجد نتائج لبحثك'), findsOneWidget);

      categories.result.complete(
        const ApiResult<List<CategoryEntity>>.success(
          data: [CategoryEntity(id: 7, name: 'مشويات')],
        ),
      );
      await tester.pumpAndSettle();

      final shown = tester
          .widget<ProductsWidget>(find.byType(ProductsWidget))
          .products;
      expect(shown.length, 1);
      expect(shown.single.id, product.id);
      expect(shown.single.category.name, 'مشويات');
      expect(find.text('لا توجد نتائج لبحثك'), findsNothing);
      expect(categories.getCalls, 1);
      expect(tester.takeException(), isNull);
    },
  );
}

class _CategoriesUseCases implements CategoriesUseCases {
  final result = Completer<ApiResult<List<CategoryEntity>>>();
  int getCalls = 0;

  @override
  Future<ApiResult<List<CategoryEntity>>> get() {
    getCalls++;
    return result.future;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) {
    throw UnimplementedError();
  }
}

class _ProductsUseCase implements ProductsUseCase {
  final result = Completer<ApiResult<List<ProductEntity>>>();

  @override
  Future<ApiResult<List<ProductEntity>>> get() {
    return result.future;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) {
    throw UnimplementedError();
  }
}
