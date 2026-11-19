import 'package:cloud_firestore/cloud_firestore.dart';

import '../domain/working_hours.dart';

/// مستند واحد يحمل إعدادات ساعات العمل الخاصة بالمطعم.
const String workingHoursDocPath = 'settings/working_hours';

class WorkingHoursDataSrc {
  /// Resolved per call so the data source never holds Firestore state from
  /// before Firebase was initialized.
  FirebaseFirestore get _firestore => FirebaseFirestore.instance;

  /// يعيد `null` عندما لا تكون الإعدادات محفوظة بعد.
  Future<WorkingHours?> get() async {
    final snapshot = await _firestore
        .doc(workingHoursDocPath)
        .get()
        .timeout(const Duration(seconds: 15));
    if (!snapshot.exists) return null;
    return WorkingHours.fromJson(snapshot.data() ?? const {});
  }

  Future<void> save(WorkingHours hours) async {
    await _firestore
        .doc(workingHoursDocPath)
        .set({
          ...hours.toJson(),
          'updatedAt': FieldValue.serverTimestamp(),
        }, SetOptions(merge: true))
        .timeout(const Duration(seconds: 15));
  }
}
