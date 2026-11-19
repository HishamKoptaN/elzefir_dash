import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_upsert_model.freezed.dart';
part 'product_upsert_model.g.dart';

@freezed
abstract class ProductUpsertReqModel with _$ProductUpsertReqModel {
  const factory ProductUpsertReqModel({
    int? id,
    String? image,
    String? name,
    String? title,
    String? description,
    num? price,
    @JsonKey(name: 'category_id') String? categoryId,
  }) = _ProductUpsertReqModel;
  factory ProductUpsertReqModel.fromJson(Map<String, dynamic> json) =>
      _$ProductUpsertReqModelFromJson(json);
}
