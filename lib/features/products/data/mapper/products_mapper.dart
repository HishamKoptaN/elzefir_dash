import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/utils/price_input.dart';
import '../../../categories/data/mapper/categories_mapper.dart';
import '../../../categories/domain/entities/categories_res_entity.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/entities/product_upsert_req_entity.dart';
import '../model/product_model.dart';
import '../model/product_upsert_model.dart';

/// Rewrites a raw product document into the shape [ProductModel] reads, so
/// documents saved while the price was a string keep loading: the stored value
/// (number or Arabic-Indic digits) lands as ASCII price text either way.
Map<String, dynamic> normalizeProductJson(Map<String, dynamic> json) {
  final normalized = Map<String, dynamic>.from(json);
  normalized['price'] = priceToText(json['price']);
  final categoryId = json['category_id'];
  if (categoryId != null) {
    normalized['category'] = {
      'id': categoryId is DocumentReference
          ? int.parse(categoryId.id)
          : categoryId,
    };
  }
  return normalized;
}

extension ProductModelMapper on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(
      id: id ?? 0,
      name: name ?? '',
      title: title ?? '',
      description: description ?? '',
      price: priceToText(price),
      image: image ?? '',
      category: category?.toEntity() ?? CategoryEntity(),
    );
  }
}

extension AdditionModelMapper on AdditionModel {
  AdditionEntity toEntity() {
    return AdditionEntity(
      id: id.toString(),
      name: name ?? '',
      title: title ?? '',
      description: description ?? '',
      price: price ?? '',
      image: image ?? '',
    );
  }
}

extension ProductUpsertReqEntityToModel on ProductUpsertReqEntity {
  ProductUpsertReqModel toModel() {
    return ProductUpsertReqModel(
      id: id,
      name: name?.value,
      title: title?.value,
      description: description?.value,
      price: parsePriceNumber(price?.value ?? ''),
      image: imageUrl?.value,
      categoryId: categoryId?.value,
    );
  }
}
