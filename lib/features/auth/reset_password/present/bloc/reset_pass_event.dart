part of 'reset_pass_bloc.dart';

@freezed
abstract class ResetPassEvent with _$ResetPassEvent {
  const factory ResetPassEvent.dataChanged({
    required ResetPassEntity resetPassEntity,
  }) = _DataChanged;
  const factory ResetPassEvent.resetPass() = _ResetPass;
}
