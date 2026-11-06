import 'package:logger/logger.dart';

class ApiErrorHandler {
  static final _logger = Logger(
    printer: PrettyPrinter(methodCount: 0, errorMethodCount: 5, colors: true),
  );
}
