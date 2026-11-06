part of 'sign_in_bloc.dart';

@freezed
class SignInEvent with _$SignInEvent {
  const factory SignInEvent.dataChanged({required SignInReqEntity signIn}) =
      _DataChanged;
  const factory SignInEvent.signIn() = _SignIn;
  const factory SignInEvent.verify() = _Verify;
  const factory SignInEvent.signInWithPhoneNumber() = _SignInWithPhoneNumber;
}
