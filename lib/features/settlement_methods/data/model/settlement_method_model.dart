import 'package:freezed_annotation/freezed_annotation.dart';

part 'settlement_method_model.freezed.dart';
part 'settlement_method_model.g.dart';

@freezed
abstract class SettlementMethodModel with _$SettlementMethodModel {
  const factory SettlementMethodModel({
    String? id,
    String? name,
    String? title,
    bool? enabled,
  }) = _SettlementMethodModel;

  factory SettlementMethodModel.fromJson(Map<String, dynamic> json) =>
      _$SettlementMethodModelFromJson(json);
}
