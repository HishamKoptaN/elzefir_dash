abstract interface class AnalyticsDataSource {
  Future<Map<String, dynamic>> getStats();

  Stream<Map<String, dynamic>> watchStats();

  Future<List<Map<String, dynamic>>> getVisitors({required int limit});

  Stream<List<Map<String, dynamic>>> watchVisitors({required int limit});
}
