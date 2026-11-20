import 'package:freezed_annotation/freezed_annotation.dart';
part 'visitor_stats_entity.freezed.dart';

@freezed
abstract class VisitorStatsEntity with _$VisitorStatsEntity {
  const factory VisitorStatsEntity({
    @Default(0) int totalVisits,
    @Default(0) int uniqueVisitors,
    DateTime? lastVisitAt,
    @Default(<String, int>{}) Map<String, int> daily,
  }) = _VisitorStatsEntity;
}
