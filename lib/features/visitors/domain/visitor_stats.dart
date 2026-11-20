import 'package:flutter/foundation.dart';

/// إحصاءات زيارات موقع الزفر كما تُخزَّن في `stats/visitors`.
@immutable
class VisitorStats {
  const VisitorStats({
    this.totalVisits = 0,
    this.uniqueVisitors = 0,
    this.lastVisitAt,
    this.daily = const {},
  });

  final int totalVisits;
  final int uniqueVisitors;
  final DateTime? lastVisitAt;
  final Map<String, int> daily;

  static const VisitorStats empty = VisitorStats();

  /// آخر 7 أيام مرتبة تصاعديًا للعرض في الرسم البياني.
  List<MapEntry<String, int>> get recentDaily {
    final entries = daily.entries.toList()
      ..sort((a, b) {
        return a.key.compareTo(b.key);
      });
    if (entries.length <= 7) {
      return entries;
    }
    return entries.sublist(entries.length - 7);
  }

  factory VisitorStats.fromJson(Map<String, dynamic> json) {
    return VisitorStats(
      totalVisits: _readInt(json['totalVisits']),
      uniqueVisitors: _readInt(json['uniqueVisitors']),
      lastVisitAt: _readDate(json['lastVisitAt']),
      daily: _readDaily(json['daily']),
    );
  }

  static int _readInt(dynamic value) {
    if (value is num) {
      return value.toInt();
    }
    return int.tryParse('$value') ?? 0;
  }

  static DateTime? _readDate(dynamic value) {
    if (value is DateTime) {
      return value;
    }
    if (value is String) {
      return DateTime.tryParse(value);
    }
    return null;
  }

  static Map<String, int> _readDaily(dynamic value) {
    if (value is! Map) {
      return const <String, int>{};
    }
    return {
      for (final entry in value.entries) '${entry.key}': _readInt(entry.value),
    };
  }
}
