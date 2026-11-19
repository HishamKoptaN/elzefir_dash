import 'package:alzefr_dash/features/products/present/blocs/product_upsert_bloc/product_upsert_bloc.dart';
import 'package:alzefr_dash/features/products/present/view/widgets/form/product_upsert_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'category_form_fixture.dart';

void main() {
  final fields = find.byType(TextFormField);
  final save = find.widgetWithText(FilledButton, 'حفظ التعديلات');
  const summary =
      'أكمل الاسم الظاهر للزبائن والوصف وبقية الحقول المطلوبة، وأدخل سعرًا رقميًا صالحًا';
  ProductUpsertForm form(WidgetTester tester) {
    return tester.widget(find.byType(ProductUpsertForm));
  }

  String text(WidgetTester tester, int index) {
    return tester.widget<TextFormField>(fields.at(index)).controller!.text;
  }

  for (final (field, index) in [('title', 1), ('description', 2)]) {
    for (final blank in ['', '   ']) {
      final kind = blank.isEmpty ? 'empty' : 'whitespace';
      testWidgets('existing product with $kind $field requires repair', (
        tester,
      ) async {
        final fixture = CategoryFormFixture()..register();
        addTearDown(fixture.dispose);
        final states = <ProductUpsertState>[];
        final subscription = fixture.productBloc.stream.listen(states.add);
        addTearDown(subscription.cancel);
        fixture.loadCategories();
        final product = index == 1
            ? fixture.product().copyWith(title: blank)
            : fixture.product().copyWith(description: blank);
        await tester.pumpWidget(fixture.app(product: product));
        await tester.pumpAndSettle();
        final error = find.text('هذا الحقل مطلوب');
        expect(error, findsOneWidget);
        expect(
          find.ancestor(of: error, matching: fields.at(index)),
          findsOneWidget,
        );
        expect(text(tester, index), blank);
        expect(find.text(summary), findsOneWidget);
        expect(tester.widget<FilledButton>(save).onPressed, isNull);
        await tester.enterText(fields.first, 'اسم معدّل');
        await tester.pumpAndSettle();
        final entered = form(tester).req;
        fixture.productBloc.add(const .upsert());
        await tester.pumpAndSettle();
        expect(form(tester).req, entered);
        expect(entered.id, product.id);
        expect(entered.categoryId?.value, product.category.id.toString());
        expect(entered.price?.value, product.price);
        expect(entered.name?.value, 'اسم معدّل');
        expect(entered.title?.value, product.title);
        expect(entered.description?.value, product.description);
        expect(text(tester, 0), 'اسم معدّل');
        expect(text(tester, index), blank);
        expect(tester.widget<FilledButton>(save).onPressed, isNull);
        expect(states, isNot(contains(const ProductUpsertState.success())));
        expect(tester.takeException(), isNull);
        await tester.enterText(fields.at(index), 'قيمة مكتملة');
        await tester.pumpAndSettle();
        expect(text(tester, index), 'قيمة مكتملة');
        expect(tester.widget<FilledButton>(save).onPressed, isNotNull);
        expect(error, findsNothing);
        expect(find.text(summary), findsNothing);
        expect(tester.takeException(), isNull);
      });
    }
  }

  testWidgets('complete products start disabled without missing field errors', (
    tester,
  ) async {
    final fixture = CategoryFormFixture()..register();
    addTearDown(fixture.dispose);
    fixture.loadCategories();
    await tester.pumpWidget(fixture.app(product: fixture.product()));
    await tester.pumpAndSettle();
    expect(tester.widget<FilledButton>(save).onPressed, isNull);
    expect(find.text(summary), findsNothing);
    expect(tester.takeException(), isNull);
  });
}
