import 'package:flutter/foundation.dart';
import 'mappers/error_mapper.dart';
import 'mappers/types/dio_error_mapper.dart';
import 'mappers/types/firebase_error_mapper.dart';
import 'mappers/types/platform_error_mapper.dart';
import 'mappers/types/socket_error_mapper.dart';
import 'mappers/types/timeout_error_mapper.dart';
import 'mappers/types/unknown_error_mapper.dart';
import 'models/error_info.dart';

class ErrorHandler {
  static final List<ErrorMapper> _mappers = [
    DioErrorMapper(),
    FirebaseErrorMapper(),
    SocketErrorMapper(),
    TimeoutErrorMapper(),
    PlatformErrorMapper(),
  ];
  static ErrorInfo handle(Object error, StackTrace? stackTrace) {
    for (final mapper in _mappers) {
      if (mapper.canHandle(error, stackTrace)) {
        final errorInfo = mapper.map(error, stackTrace);
        if (kReleaseMode && errorInfo.reportToCrashlytics) {
          _logToCrashlytics(error, stackTrace);
        }
        return errorInfo;
      }
    }
    return UnknownErrorMapper().map(error, stackTrace);
  }

  static void _logToCrashlytics(dynamic error, StackTrace? stackTrace) {
    // FirebaseCrashlytics.instance.setCustomKey('screen', currentScreen);
    // FirebaseCrashlytics.instance.setCustomKey('user_id', userId);
    // FirebaseCrashlytics.instance.setCustomKey('app_version', appVersion);
    // FirebaseCrashlytics.instance.setCustomKey('environment', 'prod');
    // FirebaseCrashlytics.instance.setCustomKey(
    //   'url',
    //   dio.requestOptions.uri.toString(),
    // );
    // FirebaseCrashlytics.instance.setCustomKey(
    //   'method',
    //   dio.requestOptions.method,
    // );
    // FirebaseCrashlytics.instance.setCustomKey(
    //   'status',
    //   dio.response?.statusCode ?? -1,
    // );
  }
}
