import 'package:flutter/foundation.dart';

import '../../data/working_hours_data_src.dart';
import '../../domain/working_hours.dart';

part 'working_hours_controller_mutations.dart';

/// يدير حالة شاشة ساعات العمل: التحميل، والتعديل، والحفظ.
class WorkingHoursController extends ChangeNotifier {
  WorkingHoursController({WorkingHoursDataSrc? dataSrc})
    : _dataSrc = dataSrc ?? WorkingHoursDataSrc();

  final WorkingHoursDataSrc _dataSrc;
  bool _disposed = false;
  bool _loading = true;
  bool _saving = false;
  Object? _loadError;
  Set<int> _days = {...WorkingHours.defaults.days};
  int _openMinutes = WorkingHours.defaults.openMinutes;
  int _closeMinutes = WorkingHours.defaults.closeMinutes;
  WorkingHours? _saved;

  bool get isLoading => _loading;
  bool get isSaving => _saving;
  Object? get loadError => _loadError;
  Set<int> get days => _days;
  int get openMinutes => _openMinutes;
  int get closeMinutes => _closeMinutes;
  WorkingHours? get saved => _saved;
  bool get allDaysSelected => _days.length == weekdayNames.length;

  WorkingHours get current {
    return WorkingHours(
      days: {..._days},
      openMinutes: _openMinutes,
      closeMinutes: _closeMinutes,
    );
  }

  bool get canSave {
    return !_saving && current.isValid && current.hasChangesComparedTo(_saved);
  }

  Future<void> load() async {
    _loading = true;
    _loadError = null;
    _notify();
    try {
      final stored = await _dataSrc.get();
      final hours = stored ?? WorkingHours.defaults;
      _saved = stored;
      _days = {...hours.days};
      _openMinutes = hours.openMinutes;
      _closeMinutes = hours.closeMinutes;
    } catch (error) {
      _loadError = error;
    } finally {
      _loading = false;
      _notify();
    }
  }

  /// يحفظ الإعدادات، ويعيد `false` عند فشل الحفظ.
  Future<bool> save() async {
    if (!current.isValid) return false;
    _saving = true;
    _notify();
    try {
      await _dataSrc.save(current);
      _saved = current;
      return true;
    } catch (_) {
      return false;
    } finally {
      _saving = false;
      _notify();
    }
  }

  void _notify() {
    if (_disposed) return;
    notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}
