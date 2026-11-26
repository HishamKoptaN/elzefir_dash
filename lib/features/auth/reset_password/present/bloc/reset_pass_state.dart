part of 'reset_pass_bloc.dart';

@freezed
abstract class ResetPassState with _$ResetPassState {
  const factory ResetPassState.loading() = ResetPassLoading;
  const factory ResetPassState.loaded({
    required ResetPassEntity resetPassEntity,
    required FormzSubmissionStatus formzSubmissionStatus,
  }) = _Loaded;
  const factory ResetPassState.success() = ResetPassSuccess;
  const factory ResetPassState.failure(String error) = ResetPassFailure;
}
