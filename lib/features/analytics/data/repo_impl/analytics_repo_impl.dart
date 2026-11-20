import 'package:injectable/injectable.dart';
import '../../../../core/errors/error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../domain/entities/visitor_entity.dart';
import '../../domain/entities/visitor_stats_entity.dart';
import '../../domain/repo/analytics_repo.dart';
import '../datasources/analytics_data_src.dart';
import '../mappers/analytics_mapper.dart';

@LazySingleton(as: AnalyticsRepo)
class AnalyticsRepoImpl implements AnalyticsRepo {
  final AnalyticsDataSource dataSource;

  AnalyticsRepoImpl(this.dataSource);

  @override
  Future<ApiResult<VisitorStatsEntity>> getVisitorStats() async {
    try {
      final json = await dataSource.getStats();
      return ApiResult.success(data: mapVisitorStats(json));
    } catch (e, s) {
      return ApiResult.failure(errorInfo: ErrorHandler.handle(e, s));
    }
  }

  @override
  Future<ApiResult<List<VisitorEntity>>> getVisitors({
    required int limit,
  }) async {
    try {
      final rows = await dataSource.getVisitors(limit: limit);
      final visitors = rows.map((row) {
        return mapVisitor(row);
      }).toList();
      return ApiResult.success(data: visitors);
    } catch (e, s) {
      return ApiResult.failure(errorInfo: ErrorHandler.handle(e, s));
    }
  }
}
