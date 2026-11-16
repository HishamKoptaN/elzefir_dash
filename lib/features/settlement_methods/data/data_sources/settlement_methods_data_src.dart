import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import '../model/settlement_method_model.dart';

abstract interface class SettlementMethodsDataSource {
  Future<List<SettlementMethodModel>> getSettlementMethods();
}

@module
abstract class FirestoreModule {
  @lazySingleton
  FirebaseFirestore get firestore => FirebaseFirestore.instance;
}

@LazySingleton(as: SettlementMethodsDataSource)
class SettlementMethodsFirestoreDataSource implements SettlementMethodsDataSource {
  final FirebaseFirestore _firestore;

  SettlementMethodsFirestoreDataSource(this._firestore);

  @override
  Future<List<SettlementMethodModel>> getSettlementMethods() async {
    final snapshot = await _firestore.collection('settlement_methods').where('enabled', isEqualTo: true).get();
    return snapshot.docs
        .map((doc) => SettlementMethodModel.fromJson({...doc.data(), 'id': doc.id}))
        .toList();
  }
}
