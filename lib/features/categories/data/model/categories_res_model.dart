import 'package:freezed_annotation/freezed_annotation.dart';
part 'categories_res_model.freezed.dart';
part 'categories_res_model.g.dart';

@freezed
abstract class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    @Default(0) @JsonKey(name: "id") int? id,
    @Default('') @JsonKey(name: "name") String? name,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
