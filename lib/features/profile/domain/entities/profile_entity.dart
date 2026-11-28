import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:universal_io/io.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile_entity.freezed.dart';

@freezed
abstract class ProfileEntity with _$ProfileEntity {
  const ProfileEntity._();
  const factory ProfileEntity({
    int? id,
    String? avatar,
    GenericFormInput? name,
    UsernameFormInput? username,
    GenericFormInput? phoneNumber,
    GenericFormInput? dialCode,
    GenericFormInput? isoCode,
    String? email,
    bool? isValidNumber,
    String? createdAt,
    @JsonKey(includeFromJson: false, includeToJson: false) File? selectedImage,
  }) = _ProfileEntity;
  bool isEdited({required ProfileEntity original}) {
    return (name?.value.trim() != original.name?.value.trim()) ||
        (username?.value.trim() != original.username?.value.trim()) ||
        (phoneNumber?.value.trim() != original.phoneNumber?.value.trim()) ||
        (selectedImage != null && selectedImage!.path != original.avatar);
  }

  /// يقرر ما إذا كان يمكن حفظ التعديل الحالي بعد اكتمال البيانات وصحتها.
  bool canSubmit({required ProfileEntity original}) {
    final isNameValid = Formz.validate([name ?? const GenericFormInput.pure()]);
    final isUsernameValid = Formz.validate([
      username ?? const GenericFormInput.pure(),
    ]);
    final isPhoneChanged =
        phoneNumber?.value.trim() != original.phoneNumber?.value.trim();
    final isPhoneValid = isPhoneChanged ? isValidNumber == true : true;
    return isEdited(original: original) &&
        isNameValid &&
        isUsernameValid &&
        isPhoneValid;
  }
}
