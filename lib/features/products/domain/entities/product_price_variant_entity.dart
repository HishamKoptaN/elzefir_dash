import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_price_variant_entity.freezed.dart';

@freezed
abstract class ProductPriceVariantEntity with _$ProductPriceVariantEntity {
  const factory ProductPriceVariantEntity({
    required String settlementMethodId,
    required String price,
  }) = _ProductPriceVariantEntity;
}
