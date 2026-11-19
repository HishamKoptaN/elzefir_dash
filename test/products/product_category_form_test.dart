import 'package:alzefr_dash/features/products/present/blocs/product_upsert_bloc/product_upsert_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'category_form_fixture.dart';

void main() {
  late CategoryFormFixture fixture;
  final dropdown = find.byType(DropdownButtonFormField<String>);

  tearDown(() async {
    await fixture.dispose();
  });

  String? selectedCategory(WidgetTester tester) {
    return tester.state<FormFieldState<String>>(dropdown).value;
  }

  testWidgets('edit form selects the saved category after delayed loading', (
    tester,
  ) async {
    fixture = CategoryFormFixture()..register();
    await tester.pumpWidget(fixture.app(product: fixture.product()));
    await tester.pump();
    expect(selectedCategory(tester), isNull);

    fixture.loadCategories();
    await tester.pumpAndSettle();

    expect(selectedCategory(tester), '7');
    expect(find.text('مشويات'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets(
    'changing category survives rebuilds and opening another product',
    (tester) async {
      fixture = CategoryFormFixture()..register();
      fixture.loadCategories();
      await tester.pumpWidget(fixture.app(product: fixture.product()));
      await tester.pumpAndSettle();
      expect(selectedCategory(tester), '7');

      await tester.ensureVisible(dropdown);
      await tester.tap(dropdown);
      await tester.pumpAndSettle();
      await tester.tap(find.text('مقبلات').last);
      await tester.pumpAndSettle();
      expect(selectedCategory(tester), '8');
      expect(
        fixture.productBloc.state.mapOrNull(
          loaded: (state) {
            return state.productUpsertReq?.categoryId?.value;
          },
        ),
        '8',
      );

      await tester.enterText(find.byType(TextFormField).first, 'اسم جديد');
      await tester.pumpAndSettle();
      expect(selectedCategory(tester), '8');

      await tester.pumpWidget(fixture.app(product: fixture.product(id: 2)));
      await tester.pumpAndSettle();
      expect(selectedCategory(tester), '7');
      expect(tester.takeException(), isNull);
    },
  );

  testWidgets('new products do not inherit the previously selected category', (
    tester,
  ) async {
    fixture = CategoryFormFixture()..register();
    fixture.loadCategories();
    await tester.pumpWidget(fixture.app(product: fixture.product()));
    await tester.pumpAndSettle();
    await tester.pumpWidget(fixture.app());
    await tester.pumpAndSettle();
    expect(selectedCategory(tester), isNull);
    expect(find.text('اختر التصنيف'), findsOneWidget);
  });

  testWidgets('an unavailable category shows the hint without an assertion', (
    tester,
  ) async {
    fixture = CategoryFormFixture()..register();
    fixture.loadCategories();
    await tester.pumpWidget(
      fixture.app(product: fixture.product(categoryId: 99)),
    );
    await tester.pumpAndSettle();
    expect(selectedCategory(tester), isNull);
    expect(tester.takeException(), isNull);
  });
}
