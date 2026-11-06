import 'dart:async';
import '../../models/error_info.dart';
import '../error_mapper.dart';

class TimeoutErrorMapper implements ErrorMapper {
  @override
  bool canHandle(Object error, StackTrace? stackTrace) {
    return error is TimeoutException;
  }

  @override
  ErrorInfo map(Object error, StackTrace? stackTrace) {
    return ErrorInfo(
      title: 'timeout_error',
      message: 'انتهت مهلة الاتصال، حاول مرة أخرى.',
    );
  }
}
