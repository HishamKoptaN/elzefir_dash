import 'package:cloud_firestore/cloud_firestore.dart';

/// The first id to try for a new document: one past the highest stored id.
///
/// This is only a starting point: the id is claimed by
/// [reserveNumericId] inside the transaction that writes the document.
Future<int> numericIdStartAfter(
  CollectionReference<Map<String, dynamic>> collection, {
  String field = 'id',
}) async {
  final latest = await collection
      .orderBy(field, descending: true)
      .limit(1)
      .get();
  final highest = latest.docs.firstOrNull?.data()[field];
  return (highest is num ? highest.toInt() : 0) + 1;
}

/// Claims the first id at or after [startFrom] that is not taken yet, inside an
/// existing [transaction].
///
/// The existence check and the document write belong to the same transaction,
/// so a contended id makes Firestore retry the transaction and this settles on
/// an id nobody else claimed. `Transaction` in this SDK cannot read a query, so
/// the ids are probed one by one, which is fine for a menu of this size.
Future<int> reserveNumericId(
  Transaction transaction,
  CollectionReference<Map<String, dynamic>> collection, {
  required int startFrom,
}) async {
  var candidate = startFrom < 1 ? 1 : startFrom;
  while ((await transaction.get(collection.doc('$candidate'))).exists) {
    candidate++;
  }
  return candidate;
}
