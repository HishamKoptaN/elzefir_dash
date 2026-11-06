import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../models/error_info.dart';
import '../error_mapper.dart';

class FirebaseErrorMapper implements ErrorMapper {
  @override
  bool canHandle(Object error, StackTrace? stackTrace) {
    return error is FirebaseAuthException;
  }

  @override
  ErrorInfo map(Object error, StackTrace? stackTrace) {
    final e = error as FirebaseAuthException;
    debugPrint('Firebase code: ${e.code}');
    debugPrint('Firebase message: ${e.message}');
    return ErrorInfo(message: _getAuthErrorMessage(e.code));
  }

  static String _getAuthErrorMessage(String? code) {
    switch (code) {
      case 'invalid-credential':
        return 'البريد الإلكتروني أو كلمة المرور غير صحيحة';
      case 'user-not-found':
        return 'لا يوجد حساب مرتبط بهذا البريد الإلكتروني.';
      case 'wrong-password':
        return 'كلمة المرور غير صحيحة. يرجى المحاولة مرة أخرى';
      case 'invalid-email':
        return 'عنوان البريد الإلكتروني غير صالح';
      case 'user-disabled':
        return 'تم تعطيل هذا الحساب';
      case 'too-many-requests':
        return 'عدد كبير جداً من المحاولات. يرجى المحاولة لاحقاً';
      case 'email-already-in-use':
        return 'البريد الإلكتروني مستخدم بالفعل';
      case 'invalid-phone-number':
        return 'رقم الهاتف الذي أدخلته غير صحيح، يرجى التأكد منه.';
      case 'invalid-verification-code':
        return 'رمز التحقق الذي أدخلته غير صحيح.';
      case 'session-expired':
        return 'انتهت صلاحية الرمز، يرجى طلب رمز جديد.';
      case 'network-request-failed':
        return 'خطأ في الاتصال بالإنترنت، يرجى التحقق من الشبكة.';
      case 'weak-password':
        return 'كلمة المرور ضعيفة جداً';
      case 'operation-not-allowed':
        return 'طريقة تسجيل الدخول هذه غير مفعلة.';
      case 'expired-action-code':
        return 'انتهت صلاحية رابط إعادة تعيين كلمة المرور.';
      case 'invalid-action-code':
        return 'رابط إعادة تعيين كلمة المرور غير صالح.';
      case 'missing-phone-number':
        return 'يرجى إدخال رقم الهاتف.';
      case 'invalid-verification-id':
        return 'معرّف جلسة التحقق غير صالح.';
      case 'quota-exceeded':
        return 'تم تجاوز الحد المسموح لإرسال الرسائل. حاول لاحقًا.';
      case 'captcha-check-failed':
        return 'فشل التحقق الأمني. حاول مرة أخرى.';
      case 'account-exists-with-different-credential':
        return 'يوجد حساب بهذا البريد الإلكتروني باستخدام طريقة تسجيل دخول أخرى.';
      case 'credential-already-in-use':
        return 'بيانات تسجيل الدخول مستخدمة بالفعل مع حساب آخر.';
      case 'provider-already-linked':
        return 'طريقة تسجيل الدخول هذه مرتبطة بالحساب بالفعل.';
      case 'no-such-provider':
        return 'طريقة تسجيل الدخول غير مرتبطة بهذا الحساب.';
      case 'requires-recent-login':
        return 'يرجى تسجيل الدخول مرة أخرى لإتمام هذه العملية.';
      default:
        return 'حدث خطأ غير متوقع. الرجاء المحاولة مرة أخرى';
    }
  }
}
