import 'package:freezed_annotation/freezed_annotation.dart';
part 'realtime_event_model.freezed.dart';
part 'realtime_event_model.g.dart';

@freezed
abstract class RealtimeEventModel with _$RealtimeEventModel {
  const factory RealtimeEventModel({
    @JsonKey(name: "id") required int? id,
    @JsonKey(name: "order_num") required String? orderNum,
    @JsonKey(name: "name") required String? name,
    @JsonKey(name: "status") required bool? status,
    @JsonKey(name: "total_amount") required String? totalAmount,
    @JsonKey(name: "country_code") required String? countryCode,
    @JsonKey(name: "created_at") required String? createdAt,
    @JsonKey(name: "updated_at") required String? updatedAt,
    @JsonKey(name: "package") required PackageModel? package,
    @JsonKey(name: "distribution_country") required DistributionCountry? distributionCountry,
    @JsonKey(name: "changes") required Map<String, dynamic>? changes,
  }) = _RealtimeEventModel;

  factory RealtimeEventModel.fromJson(Map<String, dynamic> json) =>
      _$RealtimeEventModelFromJson(json);
}

@freezed
abstract class PackageModel with _$PackageModel {
  const factory PackageModel({
    @JsonKey(name: "id") required int? id,
    @JsonKey(name: "name") required String? name,
  }) = _PackageModel;

  factory PackageModel.fromJson(Map<String, dynamic> json) =>
      _$PackageModelFromJson(json);
}

@freezed
abstract class DistributionCountry with _$DistributionCountry {
  const factory DistributionCountry({
    @JsonKey(name: "id") required int? id,
    @JsonKey(name: "name") required String? name,
  }) = _DistributionCountry;

  factory DistributionCountry.fromJson(Map<String, dynamic> json) =>
      _$DistributionCountryFromJson(json);
}
