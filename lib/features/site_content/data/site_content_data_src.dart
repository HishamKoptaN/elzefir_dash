import 'package:cloud_firestore/cloud_firestore.dart';

/// يقرأ ويكتب مستند الإعدادات العام للموقع. يُستخدم set مع merge حتى لا تُحذف
/// الحقول الأخرى في المستند (مثل بيانات العرض وساعات العمل) عند حفظ النصوص.
class SiteContentDataSrc {
  static const String _collection = 'settings';
  static const String _doc = 'general';

  FirebaseFirestore get _firestore => FirebaseFirestore.instance;

  Future<Map<String, dynamic>> get() async {
    final doc = await _firestore.collection(_collection).doc(_doc).get();
    if (!doc.exists || doc.data() == null) {
      return <String, dynamic>{};
    }
    return Map<String, dynamic>.from(doc.data()!);
  }

  Future<void> save(Map<String, dynamic> values) async {
    await _firestore
        .collection(_collection)
        .doc(_doc)
        .set(values, SetOptions(merge: true));
  }
}
