import 'package:flutter/services.dart';
import '../../models/error_info.dart';
import '../error_mapper.dart';

class PlatformErrorMapper implements ErrorMapper {
  @override
  bool canHandle(Object error, StackTrace? stackTrace) {
    return error is PlatformException;
  }

  @override
  ErrorInfo map(Object error, StackTrace? stackTrace) {
    final e = error as PlatformException;
    switch (e.code) {
      case 'PERMISSION_DENIED':
        return ErrorInfo(
          title: 'permission_denied',
          message: 'تم رفض الصلاحية المطلوبة.',
        );

      case 'NOT_AVAILABLE':
        return ErrorInfo(
          title: 'not_available',
          message: 'هذه الميزة غير متاحة على هذا الجهاز.',
        );

      default:
        return ErrorInfo(
          title: 'unknown_error',
          message: error.message ?? 'حدث خطأ بالنظام.',
        );
    }
  }
}
