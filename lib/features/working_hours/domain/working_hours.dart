import 'package:flutter/foundation.dart';

/// أيام الأسبوع بالترتيب العربي (السبت أولًا) مع أرقام [DateTime] المقابلة.
const Map<int, String> weekdayNames = {
  DateTime.saturday: 'السبت',
  DateTime.sunday: 'الأحد',
  DateTime.monday: 'الاثنين',
  DateTime.tuesday: 'الثلاثاء',
  DateTime.wednesday: 'الأربعاء',
  DateTime.thursday: 'الخميس',
  DateTime.friday: 'الجمعة',
};

/// إعدادات ساعات العمل: أيام العمل ووقت الفتح والإغلاق.
///
/// الوقت محفوظ كعدد الدقائق منذ منتصف الليل، لذلك يمكن أن يكون وقت الإغلاق
/// أصغر من وقت الفتح (أي أن العمل يمتد بعد منتصف الليل).
@immutable
class WorkingHours {
  const WorkingHours({
    required this.days,
    required this.openMinutes,
    required this.closeMinutes,
  });

  /// الأرقام من 1 (الاثنين) إلى 7 (الأحد) كما في [DateTime.weekday].
  final Set<int> days;
  final int openMinutes;
  final int closeMinutes;

  /// الافتراضي يطابق ساعات المطعم الحالية: السبت - الخميس من 10:00 ص إلى 1:00 ص.
  static const WorkingHours defaults = WorkingHours(
    days: {
      DateTime.saturday,
      DateTime.sunday,
      DateTime.monday,
      DateTime.tuesday,
      DateTime.wednesday,
      DateTime.thursday,
    },
    openMinutes: 10 * 60,
    closeMinutes: 1 * 60,
  );

  static const int _minutesInDay = 24 * 60;

  WorkingHours copyWith({
    Set<int>? days,
    int? openMinutes,
    int? closeMinutes,
  }) {
    return WorkingHours(
      days: days ?? this.days,
      openMinutes: openMinutes ?? this.openMinutes,
      closeMinutes: closeMinutes ?? this.closeMinutes,
    );
  }

  /// وقت الإغلاق في اليوم التالي لوقت الفتح.
  bool get closesNextDay => closeMinutes <= openMinutes;

  bool get isValid => days.isNotEmpty && openMinutes != closeMinutes;

  /// هل يوجد تغيير غير محفوظ مقارنةً بـ [saved]؟
  ///
  /// تعيش هذه القاعدة في طبقة الـ Domain حتى تعتمد عليها أزرار الحفظ.
  bool hasChangesComparedTo(WorkingHours? saved) {
    return saved == null || this != saved;
  }

  /// هل المطعم مفتوح في اللحظة المحددة؟
  bool isOpenAt(DateTime dateTime) {
    final minutes = dateTime.hour * 60 + dateTime.minute;
    final weekday = dateTime.weekday;
    if (!closesNextDay) {
      return days.contains(weekday) &&
          minutes >= openMinutes &&
          minutes < closeMinutes;
    }
    // العمل بعد منتصف الليل يتبع يوم الفتح السابق.
    if (minutes < closeMinutes) {
      return days.contains(_previousWeekday(weekday));
    }
    return days.contains(weekday) && minutes >= openMinutes;
  }

  static int _previousWeekday(int weekday) {
    return weekday == DateTime.monday ? DateTime.sunday : weekday - 1;
  }

  Map<String, dynamic> toJson() {
    return {
      'days': (days.toList()..sort()),
      'openMinutes': openMinutes,
      'closeMinutes': closeMinutes,
    };
  }

  factory WorkingHours.fromJson(Map<String, dynamic> json) {
    final rawDays = json['days'];
    final days = <int>{};
    if (rawDays is Iterable) {
      for (final day in rawDays) {
        final value = day is num ? day.toInt() : int.tryParse('$day');
        if (value != null && weekdayNames.containsKey(value)) {
          days.add(value);
        }
      }
    }
    return WorkingHours(
      //! A document saved before the field existed must still fall back.
      days: days.isEmpty ? WorkingHours.defaults.days : days,
      openMinutes: _parseMinutes(
        json['openMinutes'],
        WorkingHours.defaults.openMinutes,
      ),
      closeMinutes: _parseMinutes(
        json['closeMinutes'],
        WorkingHours.defaults.closeMinutes,
      ),
    );
  }

  static int _parseMinutes(dynamic value, int fallback) {
    final parsed = value is num ? value.toInt() : int.tryParse('$value');
    if (parsed == null) return fallback;
    return parsed % _minutesInDay;
  }

  @override
  bool operator ==(Object other) {
    return other is WorkingHours &&
        setEquals(days, other.days) &&
        openMinutes == other.openMinutes &&
        closeMinutes == other.closeMinutes;
  }

  @override
  int get hashCode {
    return Object.hash(Object.hashAll(days.toList()..sort()), openMinutes, closeMinutes);
  }
}

/// نص جاهز للعرض مثل "11:00 م" أو "9:00 ص".
String formatClock(int minutes) {
  final normalized = minutes % (24 * 60);
  final hour24 = normalized ~/ 60;
  final minute = normalized % 60;
  final suffix = hour24 < 12 ? 'ص' : 'م';
  var hour12 = hour24 % 12;
  if (hour12 == 0) hour12 = 12;
  return '$hour12:${minute.toString().padLeft(2, '0')} $suffix';
}

/// وصف مختصر للأيام المختارة بالترتيب العربي، مثل "السبت، الأحد، الاثنين".
String formatWorkingDays(Set<int> days) {
  final selected = weekdayNames.keys.where(days.contains).toList();
  if (selected.isEmpty) return 'لا توجد أيام محددة';
  if (selected.length == weekdayNames.length) return 'جميع أيام الأسبوع';
  return selected.map((day) => weekdayNames[day]).join('، ');
}

/// سطر كامل لساعات العمل، مثل "9:00 ص - 11:00 م (من السبت إلى الخميس)".
String formatWorkingHoursSummary(WorkingHours hours) {
  final range =
      '${formatClock(hours.openMinutes)} - ${formatClock(hours.closeMinutes)}';
  final nextDay = hours.closesNextDay ? ' (اليوم التالي)' : '';
  return '$range$nextDay — ${formatWorkingDays(hours.days)}';
}
