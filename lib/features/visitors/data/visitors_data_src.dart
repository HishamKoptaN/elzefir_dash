import 'package:cloud_firestore/cloud_firestore.dart';

import '../domain/visitor_stats.dart';

const String visitorStatsDocPath = 'stats/visitors';

/// يقرأ مستند الإحصاءات المكتوب من تطبيق الزبون بثقة مباشرة (realtime).
class VisitorsDataSrc {
  VisitorsDataSrc({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  Stream<VisitorStats> watch() {
    return _firestore.doc(visitorStatsDocPath).snapshots().map(_mapSnapshot);
  }

  VisitorStats _mapSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    if (data == null) {
      return VisitorStats.empty;
    }
    final raw = Map<String, dynamic>.from(data);
    final lastVisit = raw['lastVisitAt'];
    if (lastVisit is Timestamp) {
      raw['lastVisitAt'] = lastVisit.toDate();
    }
    return VisitorStats.fromJson(raw);
  }
}
