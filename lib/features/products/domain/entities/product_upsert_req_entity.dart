import 'package:form_inputs/form_inputs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../settlement_methods/domain/entities/settlement_method_entity.dart';
part 'product_upsert_req_entity.freezed.dart';

@freezed
abstract class ProductUpsertReqEntity with _$ProductUpsertReqEntity {
  const factory ProductUpsertReqEntity({
    int? id,
    GenericFormInput? imageUrl,
    XFileFormInput? imageFile,
    GenericFormInput? name,
    GenericFormInput? title,
    GenericFormInput? description,
    GenericFormInput? price,
    GenericFormInput? categoryId,
    @Default([]) List<SettlementMethodEntity> settlementMethods,
    bool? enabled,
  }) = _ProductUpsertReqEntity;
}
