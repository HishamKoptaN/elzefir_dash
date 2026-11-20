import '../../../../core/networking/api_result.dart';
import '../entities/visitor_entity.dart';
import '../entities/visitor_stats_entity.dart';

abstract interface class AnalyticsRepo {
  Future<ApiResult<VisitorStatsEntity>> getVisitorStats();

  Future<ApiResult<List<VisitorEntity>>> getVisitors({required int limit});
}
