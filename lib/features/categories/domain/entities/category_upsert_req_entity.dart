import 'package:form_inputs/form_inputs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'category_upsert_req_entity.freezed.dart';

@freezed
abstract class CategoryUpsertReqEntity with _$CategoryUpsertReqEntity {
  const factory CategoryUpsertReqEntity({
    int? id,
    GenericFormInput? imageUrl,
    XFileFormInput? imageFile,
    GenericFormInput? name,
    bool? enabled,
  }) = _CategoryUpsertReqEntity;
}
