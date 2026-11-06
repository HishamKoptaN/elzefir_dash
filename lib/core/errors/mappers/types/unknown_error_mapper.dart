import 'package:dio/dio.dart';

import '../../models/error_info.dart';
import '../error_mapper.dart';

class UnknownErrorMapper implements ErrorMapper {
  @override
  bool canHandle(Object error,  StackTrace? stackTrace,) {
    return error is! DioException;
  }

  @override
  ErrorInfo map(Object error, StackTrace? stackTrace) {
    return ErrorInfo(message: 'حدث خطأ غير متوقع');
  }
}
