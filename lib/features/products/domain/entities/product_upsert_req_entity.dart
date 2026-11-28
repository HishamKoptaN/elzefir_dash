import 'package:alzefr_dash/core/utils/price_input.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_upsert_req_entity.freezed.dart';

@freezed
abstract class ProductUpsertReqEntity with _$ProductUpsertReqEntity {
  const ProductUpsertReqEntity._();
  const factory ProductUpsertReqEntity({
    int? id,
    GenericFormInput? imageUrl,
    XFileFormInput? imageFile,
    GenericFormInput? name,
    GenericFormInput? title,
    GenericFormInput? description,
    GenericFormInput? price,
    GenericFormInput? priceUnit,
    GenericFormInput? categoryId,
    bool? isFeatured,
    bool? isMostRequested,
    bool? enabled,
  }) = _ProductUpsertReqEntity;

  bool isEdited({required ProductUpsertReqEntity original}) {
    return imageUrl?.value.trim() != original.imageUrl?.value.trim() ||
        imageFile?.value?.path != original.imageFile?.value?.path ||
        name?.value.trim() != original.name?.value.trim() ||
        title?.value.trim() != original.title?.value.trim() ||
        description?.value.trim() != original.description?.value.trim() ||
        price?.value.trim() != original.price?.value.trim() ||
        priceUnit?.value.trim() != original.priceUnit?.value.trim() ||
        categoryId?.value.trim() != original.categoryId?.value.trim() ||
        isFeatured != original.isFeatured ||
        isMostRequested != original.isMostRequested ||
        enabled != original.enabled;
  }

  /// يقرر ما إذا كان يمكن حفظ المنتج بعد اكتمال البيانات وصحتها ووجود تغيير.
  bool canSubmit({ProductUpsertReqEntity? original}) {
    final hasChanges = original == null || isEdited(original: original);
    return hasChanges &&
        Formz.validate([
          name ?? const GenericFormInput.pure(),
          title ?? const GenericFormInput.pure(),
          description ?? const GenericFormInput.pure(),
          price ?? const GenericFormInput.pure(),
        ]) &&
        isValidPrice(price?.value ?? '');
  }
}
