import 'package:injectable/injectable.dart';
import '../../../../core/networking/api_result.dart';
import '../entities/visitor_entity.dart';
import '../entities/visitor_stats_entity.dart';
import '../repo/analytics_repo.dart';

@singleton
class AnalyticsUseCases {
  final AnalyticsRepo repo;

  AnalyticsUseCases(this.repo);

  Future<ApiResult<VisitorStatsEntity>> getVisitorStats() {
    return repo.getVisitorStats();
  }

  Future<ApiResult<List<VisitorEntity>>> getTopVisitors({
    required int limit,
  }) {
    return repo.getVisitors(limit: limit);
  }
}
