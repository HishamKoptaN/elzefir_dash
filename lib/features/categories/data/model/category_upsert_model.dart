import 'package:freezed_annotation/freezed_annotation.dart';
part 'category_upsert_model.freezed.dart';
part 'category_upsert_model.g.dart';

@freezed
abstract class CategoryUpsertReqModel with _$CategoryUpsertReqModel {
  const factory CategoryUpsertReqModel({int? id, String? image, String? name}) =
      _CategoryUpsertReqModel;
  factory CategoryUpsertReqModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryUpsertReqModelFromJson(json);
}
