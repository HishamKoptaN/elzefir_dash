import 'package:freezed_annotation/freezed_annotation.dart';
part 'error_info.freezed.dart';

@freezed
abstract class ErrorInfo with _$ErrorInfo {
  const factory ErrorInfo({
    @Default('') String title,
    @Default('') String message,
    Object? data,
    @Default(false) bool reportToCrashlytics,
    @Default(false) bool fatal,
  }) = _ErrorInfo;
}
