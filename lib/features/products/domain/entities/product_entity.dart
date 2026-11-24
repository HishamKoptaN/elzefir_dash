import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../categories/domain/entities/categories_res_entity.dart';
part 'product_entity.freezed.dart';

@freezed
abstract class ProductEntity with _$ProductEntity {
  const factory ProductEntity({
    @Default(0) int id,
    @Default('') String name,
    @Default('') String title,
    @Default('') String description,
    @Default('') String price,
    @Default(false) bool isFeatured,
    @Default(false) bool isMostRequested,
    @Default('') String image,
    @Default(CategoryEntity()) CategoryEntity category,
  }) = _ProductEntity;
}

@freezed
abstract class AdditionEntity with _$AdditionEntity {
  const factory AdditionEntity({
    @Default('') String id,
    @Default('') String name,
    @Default('') String title,
    @Default('') String description,
    @Default('') String price,
    @Default('') String image,
  }) = _AdditionEntity;
}
