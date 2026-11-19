part of 'working_hours_controller.dart';

/// تعديلات المستخدم على أيام العمل وأوقاته.
extension WorkingHoursControllerMutations on WorkingHoursController {
  void toggleDay(int day) {
    if (!_days.remove(day)) _days.add(day);
    _notify();
  }

  void toggleAllDays() {
    if (allDaysSelected) {
      _days.clear();
    } else {
      _days = {...weekdayNames.keys};
    }
    _notify();
  }

  void pickOpenMinutes(int minutes) {
    _openMinutes = minutes;
    _notify();
  }

  void pickCloseMinutes(int minutes) {
    _closeMinutes = minutes;
    _notify();
  }

  /// يلغي التعديلات غير المحفوظة ويعيد الإعدادات إلى آخر نسخة محفوظة
  /// (أو الافتراضية عند عدم وجود محفوظات).
  void resetToSaved() {
    final saved = _saved;
    if (saved == null) {
      _days = {...WorkingHours.defaults.days};
      _openMinutes = WorkingHours.defaults.openMinutes;
      _closeMinutes = WorkingHours.defaults.closeMinutes;
    } else {
      _days = {...saved.days};
      _openMinutes = saved.openMinutes;
      _closeMinutes = saved.closeMinutes;
    }
    _notify();
  }
}
