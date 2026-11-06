import 'package:hijri/hijri_calendar.dart';

String formatHijriDate({required DateTime date}) {
  HijriCalendar.setLocal('ar');
  final hijri = HijriCalendar.fromDate(date);
  return '${hijri.hDay} ${hijri.longMonthName} ${hijri.hYear}';
}
