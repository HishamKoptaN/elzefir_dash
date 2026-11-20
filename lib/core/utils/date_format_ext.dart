extension DateTimeFormatExt on DateTime {
  String get shortArabic {
    return '$year/'
        '${month.toString().padLeft(2, '0')}/'
        '${day.toString().padLeft(2, '0')} '
        '${hour.toString().padLeft(2, '0')}:'
        '${minute.toString().padLeft(2, '0')}';
  }
}
