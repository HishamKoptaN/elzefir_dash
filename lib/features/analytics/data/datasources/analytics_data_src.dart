abstract interface class AnalyticsDataSource {
  Future<Map<String, dynamic>> getStats();

  Future<List<Map<String, dynamic>>> getVisitors({required int limit});
}
