import 'package:freezed_annotation/freezed_annotation.dart';
part 'activity_model.freezed.dart';
part 'activity_model.g.dart';

@freezed
abstract class ActivityModel with _$ActivityModel {
  const factory ActivityModel({
    @JsonKey(name: "type") required String? type,
    @JsonKey(name: "action") required String? action,
    @JsonKey(name: "id") required int? id,
    @JsonKey(name: "title") required String? title,
    @JsonKey(name: "description") required String? description,
    @JsonKey(name: "data") required Map<String, dynamic>? data,
    @JsonKey(name: "timestamp") required String? timestamp,
    @JsonKey(name: "created_at") required String? createdAt,
    @JsonKey(name: "icon") required String? icon,
    @JsonKey(name: "color") required String? color,
  }) = _ActivityModel;

  factory ActivityModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityModelFromJson(json);
}
