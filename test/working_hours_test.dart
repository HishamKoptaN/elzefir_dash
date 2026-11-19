import 'package:alzefr_dash/features/working_hours/domain/working_hours.dart';
import 'package:flutter_test/flutter_test.dart';

DateTime at(int year, int month, int day, int hour, int minute) {
  return DateTime(year, month, day, hour, minute);
}

void main() {
  group('WorkingHours.isOpenAt', () {
    // كل الأيام عدا الجمعة، من 9:00 ص إلى 11:00 م.
    final allButFriday = WorkingHours(
      days: {
        DateTime.saturday,
        DateTime.sunday,
        DateTime.monday,
        DateTime.tuesday,
        DateTime.wednesday,
        DateTime.thursday,
      },
      openMinutes: 9 * 60,
      closeMinutes: 23 * 60,
    );

    test('closes on the same day', () {
      expect(allButFriday.closesNextDay, isFalse);
    });

    test('Friday is closed all day', () {
      // 2026-11-13 is a Friday.
      expect(at(2026, 11, 13, 12, 0).weekday, DateTime.friday);
      expect(allButFriday.isOpenAt(at(2026, 11, 13, 12, 0)), isFalse);
      expect(allButFriday.isOpenAt(at(2026, 11, 13, 9, 30)), isFalse);
      expect(allButFriday.isOpenAt(at(2026, 11, 13, 22, 30)), isFalse);
    });

    test('respects the 9:00 ص - 11:00 م boundaries on an open day', () {
      // 2026-11-14 is a Saturday.
      expect(at(2026, 11, 14, 9, 0).weekday, DateTime.saturday);
      expect(allButFriday.isOpenAt(at(2026, 11, 14, 8, 59)), isFalse);
      expect(allButFriday.isOpenAt(at(2026, 11, 14, 9, 0)), isTrue);
      expect(allButFriday.isOpenAt(at(2026, 11, 14, 22, 59)), isTrue);
      expect(allButFriday.isOpenAt(at(2026, 11, 14, 23, 0)), isFalse);
      // 2026-11-15 is a Sunday.
      expect(allButFriday.isOpenAt(at(2026, 11, 15, 9, 30)), isTrue);
    });

    // السبت - الخميس من 10:00 ص إلى 1:00 ص (إغلاق بعد منتصف الليل).
    final pastMidnight = WorkingHours(
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

    test('is open after midnight when the previous day is a working day', () {
      expect(pastMidnight.closesNextDay, isTrue);
      // 00:30 on Sunday follows Saturday (open).
      expect(pastMidnight.isOpenAt(at(2026, 11, 15, 0, 30)), isTrue);
      // 00:30 on Friday follows Thursday (open).
      expect(pastMidnight.isOpenAt(at(2026, 11, 13, 0, 30)), isTrue);
    });

    test('is closed after midnight when the previous day is off', () {
      // 00:30 on Saturday follows Friday (closed).
      expect(at(2026, 11, 14, 0, 30).weekday, DateTime.saturday);
      expect(pastMidnight.isOpenAt(at(2026, 11, 14, 0, 30)), isFalse);
      // 01:00 is the closing boundary.
      expect(pastMidnight.isOpenAt(at(2026, 11, 15, 1, 0)), isFalse);
    });

    test('is closed before opening and open in the evening', () {
      expect(pastMidnight.isOpenAt(at(2026, 11, 14, 9, 59)), isFalse);
      expect(pastMidnight.isOpenAt(at(2026, 11, 14, 10, 0)), isTrue);
      expect(pastMidnight.isOpenAt(at(2026, 11, 14, 23, 30)), isTrue);
    });
  });

  group('WorkingHours json', () {
    test('round-trips days and times', () {
      final hours = WorkingHours(
        days: {
          DateTime.saturday,
          DateTime.sunday,
          DateTime.monday,
          DateTime.tuesday,
          DateTime.wednesday,
          DateTime.thursday,
        },
        openMinutes: 9 * 60,
        closeMinutes: 23 * 60,
      );
      final restored = WorkingHours.fromJson(hours.toJson());
      expect(restored, hours);
    });

    test('falls back to defaults for missing fields', () {
      expect(WorkingHours.fromJson(const {}), WorkingHours.defaults);
    });
  });

  group('formatting', () {
    test('formats times in Arabic 12-hour form', () {
      expect(formatClock(9 * 60), '9:00 ص');
      expect(formatClock(23 * 60), '11:00 م');
      expect(formatClock(0), '12:00 ص');
      expect(formatClock(1 * 60), '1:00 ص');
      expect(formatClock(12 * 60 + 15), '12:15 م');
    });

    test('summarises the saved schedule', () {
      final hours = WorkingHours(
        days: {DateTime.saturday, DateTime.friday},
        openMinutes: 9 * 60,
        closeMinutes: 23 * 60,
      );
      expect(
        formatWorkingHoursSummary(hours),
        '9:00 ص - 11:00 م — السبت، الجمعة',
      );
    });
  });
}
