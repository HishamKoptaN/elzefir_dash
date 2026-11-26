import 'package:alzefr_dash/features/working_hours/data/working_hours_data_src.dart';
import 'package:alzefr_dash/features/working_hours/domain/working_hours.dart';
import 'package:alzefr_dash/features/working_hours/present/controller/working_hours_controller.dart';
import 'package:flutter_test/flutter_test.dart';

class _FakeDataSrc extends WorkingHoursDataSrc {
  _FakeDataSrc(this.stored);

  final WorkingHours? stored;
  WorkingHours? savedValue;
  int saveCalls = 0;

  @override
  Future<WorkingHours?> get() async => stored;

  @override
  Future<void> save(WorkingHours hours) async {
    saveCalls++;
    savedValue = hours;
  }
}

void main() {
  test('تبديل الأيام وأوقات الفتح والإغلاق يحدّث الحالة ويُنبه المستمعين', () async {
    final dataSrc = _FakeDataSrc(null);
    final controller = WorkingHoursController(dataSrc: dataSrc);
    var notifications = 0;
    controller.addListener(() {
      notifications++;
    });
    await controller.load();

    final initialDays = controller.days.length;
    controller.toggleDay(DateTime.friday);
    expect(controller.days, contains(DateTime.friday));
    expect(controller.days.length, initialDays + 1);

    controller.toggleDay(DateTime.friday);
    expect(controller.days, isNot(contains(DateTime.friday)));

    controller.toggleAllDays();
    expect(controller.allDaysSelected, isTrue);
    controller.toggleAllDays();
    expect(controller.days, isEmpty);

    controller.toggleDay(DateTime.saturday);
    controller.pickOpenMinutes(8 * 60);
    controller.pickCloseMinutes(16 * 60);
    expect(controller.openMinutes, 8 * 60);
    expect(controller.closeMinutes, 16 * 60);
    expect(controller.canSave, isTrue);
    expect(notifications, greaterThan(5));
    controller.dispose();
  });

  test('الحفظ يخزّن الحالة الحالية ويعطّل الزر حتى تغيير جديد', () async {
    final dataSrc = _FakeDataSrc(WorkingHours.defaults);
    final controller = WorkingHoursController(dataSrc: dataSrc);
    await controller.load();

    controller.toggleDay(DateTime.friday);
    expect(controller.canSave, isTrue);
    expect(await controller.save(), isTrue);
    expect(dataSrc.saveCalls, 1);
    expect(dataSrc.savedValue, controller.current);
    expect(controller.canSave, isFalse);

    controller.pickOpenMinutes(9 * 60);
    expect(controller.canSave, isTrue);
    controller.dispose();
  });

  test('إعادة الضبط ترجع إلى آخر نسخة محفوظة أو إلى الافتراضي', () async {
    final saved = WorkingHours(
      days: {DateTime.saturday, DateTime.sunday},
      openMinutes: 11 * 60,
      closeMinutes: 20 * 60,
    );
    final withSaved = WorkingHoursController(dataSrc: _FakeDataSrc(saved));
    await withSaved.load();
    withSaved.pickOpenMinutes(7 * 60);
    withSaved.resetToSaved();
    expect(withSaved.current, saved);
    withSaved.dispose();

    final withoutSaved = WorkingHoursController(dataSrc: _FakeDataSrc(null));
    await withoutSaved.load();
    withoutSaved.toggleAllDays();
    withoutSaved.resetToSaved();
    expect(withoutSaved.current, WorkingHours.defaults);
    withoutSaved.dispose();
  });
}
