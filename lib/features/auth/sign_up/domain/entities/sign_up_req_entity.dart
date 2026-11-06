import 'package:form_inputs/form_inputs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_up_req_entity.freezed.dart';

@freezed
abstract class SignUpReqEntity with _$SignUpReqEntity {
  const factory SignUpReqEntity({
    GenericFormInput? name,
    EmailFormInput? email,
    UsernameFormInput? username,
    PasswordFormInput? password,
    ConfirmPasswordFormInput? confirmPassword,
    GenericFormInput? phoneNumber,
    GenericFormInput? dialCode,
    GenericFormInput? isoCode,
    bool? isValidNumber,
    bool? obscurePassword,
    bool? rememberMe,
  }) = _SignUpReqEntity;
}
