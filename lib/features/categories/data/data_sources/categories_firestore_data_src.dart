import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/services/numeric_id_allocator.dart';
import '../model/categories_res_model.dart';
import '../model/category_upsert_model.dart';
import 'categories_data_src.dart';

/// Categories live in Firestore now, so this data source replaces the old
/// REST/mock pair with a single Firestore-backed implementation.
const String categoriesCollection = 'categories';

@Singleton(as: CategoriesDataSrc)
class CategoriesFirestoreDataSrc implements CategoriesDataSrc {
  /// Resolved per call so the data source never holds Firestore state from
  /// before Firebase was initialized.
  FirebaseFirestore get _firestore => FirebaseFirestore.instance;

  @override
  Future<List<CategoryModel>> get() async {
    final snapshot = await _firestore
        .collection(categoriesCollection)
        .get()
        .timeout(const Duration(seconds: 15));
    final categories = snapshot.docs.map((doc) {
      final data = doc.data();
      return CategoryModel.fromJson({
        ...data,
        //! Doc ids keep working for documents created without an explicit id.
        'id': data['id'] ?? int.tryParse(doc.id) ?? 0,
      });
    }).toList();
    categories.sort((a, b) => (a.id ?? 0).compareTo(b.id ?? 0));
    return categories;
  }

  @override
  Future<CategoryModel> upsert(CategoryUpsertReqModel req) async {
    final name = req.name ?? '';
    final image = req.image?.trim() ?? '';
    final categories = _firestore.collection(categoriesCollection);

    final idStart = req.id == null ? await numericIdStartAfter(categories) : 1;
    late final int id;
    await _firestore.runTransaction((transaction) async {
      // The id is reserved and written in the same transaction, so concurrent
      // saves cannot overwrite each other.
      id =
          req.id ??
          await reserveNumericId(transaction, categories, startFrom: idStart);
      transaction.set(
        categories.doc(id.toString()),
        <String, dynamic>{
          'id': id,
          'name': name,
          //! An empty image means "keep the one already stored".
          if (image.isNotEmpty) 'image': image,
        },
        SetOptions(merge: true),
      );
    });
    return CategoryModel(id: id, name: name, image: image);
  }
}
