import 'dart:io';
import '../../models/error_info.dart';
import '../error_mapper.dart';

class SocketErrorMapper implements ErrorMapper {
  @override
  bool canHandle(Object error, StackTrace? stackTrace) {
    return error is SocketException;
  }

  @override
  ErrorInfo map(Object error, StackTrace? stackTrace) {
    return ErrorInfo(
      title: 'network_error',
      message: 'تعذر الاتصال بالإنترنت.',
    );
  }
}
