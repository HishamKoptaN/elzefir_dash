import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_model.freezed.dart';
part 'country_model.g.dart';

@freezed
abstract class CountryModel with _$CountryModel {
  const factory CountryModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'code') String? code,
  }) = _CountryModel;
  factory CountryModel.fromJson(Map<String, Object?> json) =>
      _$CountryModelFromJson(json);
}
