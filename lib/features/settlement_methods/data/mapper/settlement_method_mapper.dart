import '../../domain/entities/settlement_method_entity.dart';
import '../model/settlement_method_model.dart';

extension SettlementMethodModelMapper on SettlementMethodModel {
  SettlementMethodEntity toEntity() {
    return SettlementMethodEntity(
      id: id ?? '',
      name: name ?? '',
      title: title ?? '',
      enabled: enabled ?? true,
    );
  }
}
