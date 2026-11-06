import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../categories/data/model/categories_res_model.dart';
part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
abstract class ProductModel with _$ProductModel {
  const factory ProductModel({
    int? id,
    String? image,
    String? name,
    String? title,
    String? description,
    String? price,
    CategoryModel? category,
  }) = _ProductModel;
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

@freezed
abstract class AdditionModel with _$AdditionModel {
  const factory AdditionModel({
    int? id,
    String? image,
    String? name,
    String? title,
    String? description,
    String? price,
  }) = _AdditionModel;
  factory AdditionModel.fromJson(Map<String, dynamic> json) =>
      _$AdditionModelFromJson(json);
}
