import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'analytics_data_src.dart';

@Singleton(as: AnalyticsDataSource)
class AnalyticsFirestoreDataSrc implements AnalyticsDataSource {
  static const String statsDocPath = 'stats/visitors';
  static const String visitorsCollection = 'visitors';

  /// Resolved per call so the source never holds Firestore state from before
  /// Firebase was initialized.
  FirebaseFirestore get _firestore {
    return FirebaseFirestore.instance;
  }

  @override
  Future<Map<String, dynamic>> getStats() async {
    final snapshot = await _firestore.doc(statsDocPath).get().timeout(
      const Duration(seconds: 15),
    );
    return snapshot.data() ?? <String, dynamic>{};
  }

  @override
  Future<List<Map<String, dynamic>>> getVisitors({required int limit}) async {
    final snapshot = await _firestore
        .collection(visitorsCollection)
        .orderBy('lastSeenAt', descending: true)
        .limit(limit)
        .get()
        .timeout(const Duration(seconds: 15));
    return snapshot.docs.map((doc) {
      return <String, dynamic>{'id': doc.id, ...doc.data()};
    }).toList();
  }
}
