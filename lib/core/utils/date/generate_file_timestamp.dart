import 'package:intl/intl.dart';

class FileUtils {
  static String generateFileTimestamp() {
    return DateFormat('yyyy-MM-dd_HH-mm-ss').format(DateTime.now());
  }
}
