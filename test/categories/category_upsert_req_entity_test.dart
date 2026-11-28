import 'package:alzefr_dash/features/categories/domain/entities/category_upsert_req_entity.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:flutter_test/flutter_test.dart';

CategoryUpsertReqEntity _category({String name = 'مشويات'}) {
  return CategoryUpsertReqEntity(
    id: 1,
    name: GenericFormInput.dirty(value: name),
  );
}

void main() {
  group('CategoryUpsertReqEntity.canSubmit', () {
    final original = _category();

    test('يرفض الحفظ عند عدم وجود تغيير', () {
      expect(_category().canSubmit(original: original), isFalse);
    });

    test('يسمح الحفظ عند تغيير الاسم', () {
      expect(_category(name: 'مقبلات').canSubmit(original: original), isTrue);
    });

    test('يرفض الحفظ مع اسم فارغ', () {
      expect(_category(name: '').canSubmit(original: original), isFalse);
    });

    test('يسمح حفظ تصنيف جديد صالح بدون كيان أصلي', () {
      expect(_category().canSubmit(), isTrue);
    });
  });
}
