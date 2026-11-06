import 'package:freezed_annotation/freezed_annotation.dart';
part 'categories_res_entity.freezed.dart';

@freezed
abstract class CategoryEntity with _$CategoryEntity {
  const factory CategoryEntity({
    @Default(0) int id,
    @Default('') String image,
    @Default('') String name,
  }) = _CategoryEntity;
}
