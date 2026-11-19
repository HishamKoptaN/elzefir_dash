import 'package:alzefr_dash/features/products/data/mapper/products_mapper.dart';
import 'package:alzefr_dash/features/products/data/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore: subtype_of_sealed_class
class _CategoryReference implements DocumentReference<Map<String, dynamic>> {
  const _CategoryReference(this.id);

  @override
  final String id;

  @override
  dynamic noSuchMethod(Invocation invocation) {
    throw UnimplementedError();
  }
}

void main() {
  test('loads category references alongside numeric category ids', () {
    final products =
        [
          {'id': 1, 'category_id': 1},
          {'id': 10, 'category_id': const _CategoryReference('2')},
        ].map((json) {
          return ProductModel.fromJson(normalizeProductJson(json)).toEntity();
        }).toList();

    expect(
      products.map((product) {
        return product.category.id;
      }),
      [1, 2],
    );
  });

  test('loads the saved category id into the product used for editing', () {
    final product = ProductModel.fromJson(
      normalizeProductJson({'id': 1, 'price': 130, 'category_id': 7}),
    ).toEntity();

    expect(product.category.id, 7);
  });

  test('saved category id takes precedence over an embedded category', () {
    final product = ProductModel.fromJson(
      normalizeProductJson({
        'category_id': 7,
        'category': {'id': 2},
      }),
    ).toEntity();

    expect(product.category.id, 7);
  });

  test('preserves embedded categories without a saved category id', () {
    final product = ProductModel.fromJson(
      normalizeProductJson({
        'category': {'id': 2, 'name': 'مشويات'},
      }),
    ).toEntity();

    expect(product.category.id, 2);
    expect(product.category.name, 'مشويات');
  });

  test('allows a product without a category', () {
    final product = ProductModel.fromJson(normalizeProductJson({})).toEntity();

    expect(product.category.id, 0);
  });
}
