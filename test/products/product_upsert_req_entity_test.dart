import 'package:alzefr_dash/features/products/domain/entities/product_upsert_req_entity.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:flutter_test/flutter_test.dart';

ProductUpsertReqEntity _product({
  String name = 'بوري مشوي',
  String title = 'بوري مشوي على الفحم',
  String description = 'سمك على الفحم',
  String price = '130',
}) {
  return ProductUpsertReqEntity(
    id: 1,
    name: GenericFormInput.dirty(value: name),
    title: GenericFormInput.dirty(value: title),
    description: GenericFormInput.dirty(value: description),
    price: GenericFormInput.dirty(value: price),
    categoryId: const GenericFormInput.dirty(value: '7'),
  );
}

void main() {
  group('ProductUpsertReqEntity.canSubmit', () {
    final original = _product();

    test('يرفض الحفظ عند عدم وجود تغيير', () {
      expect(_product().canSubmit(original: original), isFalse);
    });

    test('يسمح الحفظ عند تغيير صالح', () {
      expect(_product(name: 'سمك مشوي').canSubmit(original: original), isTrue);
    });

    test('يرفض الحفظ مع سعر غير صالح', () {
      expect(_product(price: '0').canSubmit(original: original), isFalse);
    });

    test('يرفض الحفظ مع عنوان فارغ', () {
      expect(_product(title: '').canSubmit(original: original), isFalse);
    });

    test('يسمح حفظ منتج جديد صالح بدون كيان أصلي', () {
      expect(_product().canSubmit(), isTrue);
    });
  });
}
