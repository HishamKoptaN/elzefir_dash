import 'package:dio/dio.dart';

import '../../models/error_info.dart';
import '../error_mapper.dart';

class DioErrorMapper implements ErrorMapper {
  @override
  bool canHandle(Object error, StackTrace? stackTrace) {
    return error is DioException;
  }

  @override
  ErrorInfo map(Object error, StackTrace? stackTrace) {
    return _map(error as DioException);
  }

  ErrorInfo _map(DioException exception) {
    if (exception.type == DioExceptionType.badResponse) {
      final data = exception.response?.data;
      if (data is Map<String, dynamic>) {
        final title = data['title'];
        final message = data['message'];
        if (message is String && message.isNotEmpty) {
          return ErrorInfo(
            title: title is String ? title : '',
            message: message,
            data: data,
            reportToCrashlytics: (exception.response?.statusCode ?? 0) >= 500,
          );
        }
      }
      return ErrorInfo(
        message: _handleHttpError(exception.response?.statusCode ?? 0),
        reportToCrashlytics: (exception.response?.statusCode ?? 0) >= 500,
      );
    }
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        return ErrorInfo(
          message: 'انتهت مهلة الاتصال',
          reportToCrashlytics: true,
        );
      case DioExceptionType.sendTimeout:
        return ErrorInfo(
          message: 'انتهت مهلة إرسال البيانات',
          reportToCrashlytics: true,
        );
      case DioExceptionType.receiveTimeout:
        return ErrorInfo(
          message: 'انتهت مهلة استقبال البيانات',
          reportToCrashlytics: true,
        );
      case DioExceptionType.cancel:
        return ErrorInfo(message: 'تم إلغاء الطلب');
      case DioExceptionType.connectionError:
        return ErrorInfo(
          message: 'خطأ في الاتصال بالإنترنت',
          reportToCrashlytics: true,
        );
      case DioExceptionType.badResponse:
        return ErrorInfo(
          message: _handleHttpError(exception.response?.statusCode ?? 0),
          reportToCrashlytics: exception.response?.statusCode == 500
              ? true
              : false,
        );
      case DioExceptionType.unknown:
        return const ErrorInfo(title: 'خطأ', message: 'حدث خطأ غير متوقع');
      default:
        return ErrorInfo(message: 'خطأ غير متوقع');
    }
  }

  static String _handleHttpError(int statusCode) {
    switch (statusCode) {
      case 400:
        return ' طلب غير صحيح,  الرجا المحاولة مره اخري ';
      case 401:
        return 'غير مصرح لك بالدخول، الرجاء تسجيل الدخول مرة اخرى';
      case 403:
        return 'غير مصرح بالدخول';
      case 404:
        return 'عذراً، لم نتمكن من العثور على الصفحة المطلوبة';
      case 500:
      case 502:
      case 503:
      case 504:
        return 'عذراً، حدث خطأ في الخادم، يرجى المحاولة مرة اخرى لاحقاً';
      default:
        return 'عذراً، حدث خطأ غير متوقع، يرجى المحاولة مرة اخرى لاحقاً';
    }
  }
}
