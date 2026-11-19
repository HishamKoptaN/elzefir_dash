import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../../core/di/dependency_injection.dart';
import '../../../../../../../core/networking/api_result.dart';
import '../../../../../../core/errors/error_handler.dart';
import '../../../../../../core/errors/models/error_info.dart';
import '../../../../auth/present/blocs/auth_bloc/auth_bloc.dart';
import '../../../../sign_up/domain/entities/sign_up_req_entity.dart';
import '../../../../sign_up/domain/use_cases/sign_up_use_cases.dart';
import '../../../domain/entities/sign_in_req_entity.dart';
import '../../../domain/use_cases/sign_in_use_cases.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'sign_in_bloc.freezed.dart';
part 'sign_in_event.dart';
part 'sign_in_state.dart';

@lazySingleton
class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInUseCases signInUseCases;
  SignInBloc({required this.signInUseCases})
    : super(
        SignInState.loaded(
          signIn: SignInReqEntity(),
          formzSubmissionStatus: FormzSubmissionStatus.initial,
        ),
      ) {
    on<SignInEvent>((event, emit) async {
      await event.when(
        signIn: () async {
          await state.whenOrNull(
            loaded: (signIn, formzSubmissionStatus) async {
              _emitCustomLoaded(
                emit: emit,
                signIn: signIn,
                formzSubmissionStatus: FormzSubmissionStatus.inProgress,
              );
              final res = await signInUseCases.signIn(signIn: signIn);
              await res.when(
                success: (data) {
                  _emitCustomLoaded(emit: emit, signIn: SignInReqEntity.init());
                },
                failure: (error) {
                  emit(SignInState.failure(apiError: error));
                  _emitCustomLoaded(emit: emit, signIn: signIn);
                },
              );
            },
          );
        },
        dataChanged: (signIn) async {
          await state.mapOrNull(
            loaded: (state) async {
              _emitCustomLoaded(emit: emit, signIn: signIn);
            },
          );
        },
        verify: () async {
          await state.mapOrNull(
            loaded: (state) async {
              try {
                _emitCustomLoaded(
                  emit: emit,
                  signIn: state.signIn,
                  formzSubmissionStatus: FormzSubmissionStatus.inProgress,
                );
                await FirebaseAuth.instance.signInWithPhoneNumber(
                  '+${state.signIn.dialCode?.value}${state.signIn.phoneNumber?.value}',
                );
                // await getIt<FirebaseAuth>().verifyPhoneNumber(
                //   phoneNumber:
                //       '+${state.signIn.dialCode?.value}${state.signIn.phoneNumber?.value}',
                //   verificationCompleted: (credential) {},
                //   verificationFailed: (firebaseAuthException) {
                //     emit(
                //       SignInState.failure(
                //         apiError: ApiErrorModel(
                //           title: firebaseAuthException.code,
                //           message: firebaseAuthException.message,
                //         ),
                //       ),
                //     );
                //     _emitCustomLoaded(emit: emit, signIn: state.signIn);
                //   },
                //   codeSent: (verificationId, resendToken) {
                //     emit(SignInState.success());
                //     _emitCustomLoaded(
                //       emit: emit,
                //       signIn: state.signIn.copyWith(
                //         verificationId: verificationId,
                //       ),
                //     );
                //   },
                //   codeAutoRetrievalTimeout: (verificationId) {},
                // );
              } catch (e, stackTrace) {
                emit(
                  SignInState.failure(
                    apiError: ErrorHandler.handle(e, stackTrace),
                  ),
                );
                _emitCustomLoaded(emit: emit, signIn: state.signIn);
              }
            },
          );
        },
        signInWithPhoneNumber: () async {
          await state.mapOrNull(
            loaded: (state) async {
              _emitCustomLoaded(
                emit: emit,
                signIn: state.signIn,
                formzSubmissionStatus: FormzSubmissionStatus.inProgress,
              );
              try {
                await getIt<FirebaseAuth>().signInWithCredential(
                  PhoneAuthProvider.credential(
                    verificationId: state.signIn.verificationId ?? '',
                    smsCode: state.signIn.smsCode ?? '',
                  ),
                );
                getIt<SignUpUseCases>().signUp(signUpReq: SignUpReqEntity());
                final completer = Completer<void>();
                getIt<AuthBloc>().add(
                  AuthEvent.authToken(onComplete: completer),
                );
                await completer.future;
                _emitCustomLoaded(emit: emit, signIn: SignInReqEntity.init());
              } catch (e, stackTrace) {
                emit(
                  SignInState.failure(
                    apiError: ErrorHandler.handle(e, stackTrace),
                  ),
                );
                _emitCustomLoaded(emit: emit, signIn: state.signIn);
              }
            },
          );
        },
      );
    });
  }

  void _emitCustomLoaded({
    required Emitter<SignInState> emit,
    required SignInReqEntity signIn,
    FormzSubmissionStatus? formzSubmissionStatus,
  }) {
    emit(
      SignInState.loaded(
        signIn: signIn,
        formzSubmissionStatus:
            formzSubmissionStatus ??
            (Formz.validate([
                  signIn.email ?? EmailFormInput.pure(),
                  signIn.password ?? PasswordFormInput.pure(),
                ])
                ? FormzSubmissionStatus.success
                : FormzSubmissionStatus.failure),
      ),
    );
  }
}
