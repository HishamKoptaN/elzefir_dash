import 'package:flutter/foundation.dart';

import '../../data/site_content_data_src.dart';
import '../../domain/site_content_fields.dart';

/// يحمل نصوص الموقع القابلة للتحرير، ويقارنها بالنسخة المحفوظة لتفعيل زر الحفظ.
class SiteContentController extends ChangeNotifier {
  SiteContentController({SiteContentDataSrc? dataSrc})
    : _dataSrc = dataSrc ?? SiteContentDataSrc();

  final SiteContentDataSrc _dataSrc;
  Map<String, String> _values = {
    for (final field in SiteContentField.all) field.key: field.fallback,
  };
  Map<String, String> _saved = const {};
  bool _loading = true;
  bool _saving = false;
  Object? _error;

  bool get isLoading => _loading;
  bool get isSaving => _saving;
  Object? get error => _error;
  bool get canSave =>
      !_saving &&
      !_loading &&
      _values.entries.any((entry) => entry.value != (_saved[entry.key] ?? ''));

  String valueOf(String key) => _values[key] ?? '';

  void setValue(String key, String value) {
    _values[key] = value;
    notifyListeners();
  }

  Future<void> load() async {
    _loading = true;
    _error = null;
    notifyListeners();
    try {
      final raw = await _dataSrc.get();
      _values = {
        for (final field in SiteContentField.all)
          field.key: _storedText(raw, field),
      };
      _saved = Map<String, String>.from(_values);
    } catch (error) {
      _error = error;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<bool> save() async {
    if (!canSave) return false;
    _saving = true;
    notifyListeners();
    try {
      await _dataSrc.save(Map<String, dynamic>.from(_values));
      _saved = Map<String, String>.from(_values);
      return true;
    } catch (_) {
      return false;
    } finally {
      _saving = false;
      notifyListeners();
    }
  }

  static String _storedText(Map<String, dynamic> raw, SiteContentField field) {
    final value = raw[field.key];
    return value is String && value.trim().isNotEmpty
        ? value.trim()
        : field.fallback;
  }
}
