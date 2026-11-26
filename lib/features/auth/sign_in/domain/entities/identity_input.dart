import 'package:formz/formz.dart';

// 1. تعريف حالات الخطأ
enum IdentityValidationError { empty, invalid }

class IdentityInput extends FormzInput<String, IdentityValidationError> {
  const IdentityInput.pure() : super.pure('');
  const IdentityInput.dirty([super.value = '']) : super.dirty();
  // تعبير نمطي بسيط للتحقق من تنسيق الإيميل
  static final RegExp _emailRegex = RegExp(
    r'^[\w\.\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z]{2,}$',
  );

  // تعبير نمطي لاسم المستخدم (حروف، أرقام، شرطة سفلية)
  static final RegExp _usernameRegex = RegExp(r'^[a-zA-Z0-9_]{3,30}$');

  // 2. الحصول على رسالة الخطأ
  String? get errorMessage {
    return switch (error) {
      null => null,
      IdentityValidationError.empty =>
        'يرجى إدخال البريد الإلكتروني أو اسم المستخدم',
      IdentityValidationError.invalid =>
        'صيغة الإيميل أو اسم المستخدم غير صحيحة',
    };
  }

  // 3. منطق التحقق الذكي
  @override
  IdentityValidationError? validator(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) return IdentityValidationError.empty;

    // إذا كان يحتوي على @ فهو إيميل، إذا لم يحتوِ فهو اسم مستخدم
    if (trimmed.contains('@')) {
      return _emailRegex.hasMatch(trimmed)
          ? null
          : IdentityValidationError.invalid;
    } else {
      return _usernameRegex.hasMatch(trimmed)
          ? null
          : IdentityValidationError.invalid;
    }
  }
}
