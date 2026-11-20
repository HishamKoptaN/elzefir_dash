import 'package:freezed_annotation/freezed_annotation.dart';
import 'visitor_stats_entity.dart';
part 'daily_visits_entity.freezed.dart';

@freezed
abstract class DailyVisitsEntity with _$DailyVisitsEntity {
  const factory DailyVisitsEntity({
    required String day,
    required int visits,
  }) = _DailyVisitsEntity;
}

extension VisitorStatsMetrics on VisitorStatsEntity {
  List<DailyVisitsEntity> get sortedDaily {
    final entries = daily.entries.toList()
      ..sort((a, b) {
        return a.key.compareTo(b.key);
      });
    return entries.map((entry) {
      return DailyVisitsEntity(day: entry.key, visits: entry.value);
    }).toList();
  }

  int get todayVisits {
    final now = DateTime.now();
    final key = '${now.year}-'
        '${now.month.toString().padLeft(2, '0')}-'
        '${now.day.toString().padLeft(2, '0')}';
    return daily[key] ?? 0;
  }

  double get averageVisits {
    if (daily.isEmpty) {
      return 0;
    }
    return totalVisits / daily.length;
  }
}
