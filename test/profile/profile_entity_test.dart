import 'package:alzefr_dash/features/profile/domain/entities/profile_entity.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:flutter_test/flutter_test.dart';

ProfileEntity _profile({
  String name = 'هشام',
  String username = 'hisham123',
  String phone = '123456789',
  bool isValidNumber = true,
}) {
  return ProfileEntity(
    name: GenericFormInput.dirty(value: name),
    username: UsernameFormInput.dirty(username),
    phoneNumber: GenericFormInput.dirty(value: phone),
    isValidNumber: isValidNumber,
  );
}

void main() {
  group('ProfileEntity.canSubmit', () {
    final original = _profile();

    test('يرفض الحفظ عند عدم وجود تغيير', () {
      expect(_profile().canSubmit(original: original), isFalse);
    });

    test('يسمح الحفظ عند تغيير الاسم مع صحة البيانات', () {
      final updated = _profile(name: 'أحمد');

      expect(updated.canSubmit(original: original), isTrue);
    });

    test('يرفض الحفظ مع اسم مستخدم غير صالح', () {
      final updated = _profile(name: 'أحمد', username: 'abc');

      expect(updated.canSubmit(original: original), isFalse);
    });

    test('يرفض الحفظ عند تغيير الهاتف مع رقم غير صالح', () {
      final updated = _profile(phone: '999', isValidNumber: false);

      expect(updated.canSubmit(original: original), isFalse);
    });

    test('يسمح الحفظ عند تغيير الهاتف مع رقم صالح', () {
      final updated = _profile(phone: '987654321');

      expect(updated.canSubmit(original: original), isTrue);
    });
  });
}
