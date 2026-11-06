part of 'sign_in_bloc.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState.initial() = _Initial;
  const factory SignInState.loading() = _Loading;
  const factory SignInState.loaded({
    required SignInReqEntity signIn,
    required FormzSubmissionStatus formzSubmissionStatus,
  }) = _Loaded;
  const factory SignInState.success() = _Success;
  const factory SignInState.failure({required ErrorInfo apiError}) = _Failure;
  const factory SignInState.unauthenticated() = _Unauthenticated;
}
