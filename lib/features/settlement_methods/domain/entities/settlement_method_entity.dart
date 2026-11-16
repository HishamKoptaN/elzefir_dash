import 'package:freezed_annotation/freezed_annotation.dart';

part 'settlement_method_entity.freezed.dart';

@freezed
abstract class SettlementMethodEntity with _$SettlementMethodEntity {
  const factory SettlementMethodEntity({
    @Default('') String id,
    @Default('') String name,
    @Default('') String title,
    @Default(true) bool enabled,
  }) = _SettlementMethodEntity;
}
