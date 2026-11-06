import 'package:form_inputs/form_inputs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_pass_entity.freezed.dart';

@freezed
abstract class ResetPassEntity with _$ResetPassEntity {
  const factory ResetPassEntity({
    PasswordFormInput? oldPassword,
    PasswordFormInput? newPassword,
    PasswordFormInput? confirmPassword,
    @Default(true) bool obscurePassword,
  }) = _ResetPassEntity;
}
