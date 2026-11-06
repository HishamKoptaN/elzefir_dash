import 'package:intl/intl.dart';

extension DateTimeFormatterX on DateTime {
  //! 2026-06-17 11:44 PM
  String toFullDateTimeString() {
    final DateTime localDateTime = toLocal();
    final DateFormat formatter = DateFormat('yyyy-MM-dd hh:mm a', 'en');
    final formatted = formatter.format(localDateTime);
    return formatted.replaceAll('AM', 'ص').replaceAll('PM', 'م');
  }

  //! 2026-06-17
  String toFormattedDateString() {
    final DateTime localDateTime = toLocal();
    final DateFormat formatter = DateFormat('yyyy-MM-dd', 'en');
    return formatter.format(localDateTime);
  }

  //! 11:44 PM
  String toFormattedTimeString() {
    final DateTime localDateTime = toLocal();
    final DateFormat formatter = DateFormat('hh:mm a', 'en');
    String formatted = formatter.format(localDateTime);
    return formatted.replaceAll('AM', 'ص').replaceAll('PM', 'م');
  }

  //! الآن , منذ 5 دقائق , منذ ساعة , أمس , منذ يومين , منذ 5 أيام , منذ شهر , منذ سنة
  String toRelativeTimeString() {
    final DateTime localDateTime = toLocal();
    final Duration difference = DateTime.now().difference(localDateTime);

    if (difference.inSeconds < 60) {
      return 'الآن';
    } else if (difference.inMinutes < 60) {
      return 'منذ ${difference.inMinutes} دقيقة';
    } else if (difference.inHours < 24) {
      return 'منذ ${difference.inHours} ساعة';
    } else if (difference.inDays == 1) {
      return 'أمس';
    } else if (difference.inDays == 2) {
      return 'منذ يومين';
    } else if (difference.inDays <= 10) {
      return 'منذ ${difference.inDays} أيام';
    } else {
      return toFormattedDateString();
    }
  }
}
