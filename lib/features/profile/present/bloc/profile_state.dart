part of 'profile_bloc.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState.init() = _Init;
  const factory ProfileState.loading() = _ProfileLoading;
  const factory ProfileState.loaded({
    required ProfileEntity profile,
    required ProfileEntity? updatedProfile,
    @Default(FormzSubmissionStatus.initial)
    FormzSubmissionStatus formzSubmissionStatus,
    @Default(false) bool isLoading,
  }) = _Loaded;
  const factory ProfileState.success() = _Success;
  const factory ProfileState.failure({required ErrorInfo apiErrorModel}) =
      _Failure;
}
