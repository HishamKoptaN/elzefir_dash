import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../categories/domain/entities/categories_res_entity.dart';
import '../../../products/domain/entities/product_entity.dart';
part 'home_res_entity.freezed.dart';

@freezed
abstract class HomeResEntity with _$HomeResEntity {
  const factory HomeResEntity({
    String? offerImage,
    @Default([]) List<CategoryEntity> categories,
    @Default([]) List<ProductEntity> products,
    @Default([]) List<AdditionEntity> additions,
  }) = _HomeResEntity;
}
