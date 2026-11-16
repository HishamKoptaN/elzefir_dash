import '../../../categories/data/mapper/categories_mapper.dart';
import '../../../categories/domain/entities/categories_res_entity.dart';
import '../../../settlement_methods/data/mapper/settlement_method_mapper.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/entities/product_price_variant_entity.dart';
import '../../domain/entities/product_upsert_req_entity.dart';
import '../model/product_model.dart';
import '../model/product_upsert_model.dart';

extension ProductModelMapper on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(
      id: id ?? 0,
      name: name ?? '',
      title: title ?? '',
      description: description ?? '',
      price: price ?? '',
      image: image ?? '',
      category: category?.toEntity() ?? CategoryEntity(),
      settlementMethods:
          settlementMethods?.map((e) => e.toEntity()).toList() ??
          [],
      priceVariants:
          priceVariants?.map((e) => ProductPriceVariantEntity(
            settlementMethodId: e['settlement_method_id'] ?? '',
            price: e['price'] ?? '',
          )).toList() ??
          [],
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
      price: price?.value,
      image: imageUrl?.value,
      categoryId: categoryId?.value,
      settlementMethodIds: settlementMethods.map((e) => e.id).toList(),
      priceVariants: priceVariants.map((e) => {
        'settlement_method_id': e.settlementMethodId,
        'price': e.price,
      }).toList(),
    );
  }
}
