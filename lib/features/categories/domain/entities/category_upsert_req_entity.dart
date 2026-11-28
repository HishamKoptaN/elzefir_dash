import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'category_upsert_req_entity.freezed.dart';

@freezed
abstract class CategoryUpsertReqEntity with _$CategoryUpsertReqEntity {
  const CategoryUpsertReqEntity._();
  const factory CategoryUpsertReqEntity({
    int? id,
    GenericFormInput? imageUrl,
    XFileFormInput? imageFile,
    GenericFormInput? name,
    bool? enabled,
  }) = _CategoryUpsertReqEntity;

  bool isEdited({required CategoryUpsertReqEntity original}) {
    return imageUrl?.value.trim() != original.imageUrl?.value.trim() ||
        imageFile?.value?.path != original.imageFile?.value?.path ||
        name?.value.trim() != original.name?.value.trim() ||
        enabled != original.enabled;
  }

  /// يقرر ما إذا كان يمكن حفظ التصنيف بعد اكتمال البيانات وصحتها ووجود تغيير.
  bool canSubmit({CategoryUpsertReqEntity? original}) {
    final hasChanges = original == null || isEdited(original: original);
    return hasChanges &&
        Formz.validate([name ?? const GenericFormInput.pure()]);
  }
}
