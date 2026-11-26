import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/di/dependency_injection.dart';
import '../../../../../core/errors/models/error_info.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../../auth/present/blocs/auth_bloc/auth_bloc.dart';
import '../../domain/entities/sign_up_req_entity.dart';
import '../../domain/use_cases/sign_up_use_cases.dart';

part 'sign_up_bloc.freezed.dart';
part 'sign_up_event.dart';
part 'sign_up_state.dart';

@lazySingleton
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUseCases signUpUseCases;

  SignUpBloc({required this.signUpUseCases})
    : super(
        SignUpState.loaded(
          signUpReq: SignUpReqEntity(),
          formzSubmissionStatus: FormzSubmissionStatus.initial,
        ),
      ) {
    on<SignUpEvent>((event, emit) async {
      await event.when(
        signUp: () async {
          await state.mapOrNull(
            loaded: (state) async {
              _emitCustomLoaded(
                emit: emit,
                state: state.copyWith(
                  formzSubmissionStatus: FormzSubmissionStatus.inProgress,
                ),
                formzSubmissionStatus: FormzSubmissionStatus.inProgress,
              );
              final result = await signUpUseCases.signUp(
                signUpReq: state.signUpReq,
              );
              await result.when(
                success: (_) async {
                  _emitCustomLoaded(
                    emit: emit,
                    state: state.copyWith(
                      signUpReq: SignUpReqEntity(),
                      formzSubmissionStatus: FormzSubmissionStatus.success,
                    ),
                  );
                  getIt<AuthBloc>().add(const AuthEvent.emitAuthenticated());
                },
                failure: (apiErrorModel) {
                  emitCustomFailure(emit: emit, apiErrorModel: apiErrorModel);
                  _emitCustomLoaded(emit: emit, state: state);
                },
              );
            },
          );
        },
        dataChanged: (signUpReq) async {
          await state.mapOrNull(
            loaded: (state) {
              _emitCustomLoaded(
                emit: emit,
                state: state.copyWith(signUpReq: signUpReq!),
              );
            },
          );
        },
      );
    });
  }

  void _emitCustomLoaded({
    required Emitter<SignUpState> emit,
    required _Loaded state,
    FormzSubmissionStatus? formzSubmissionStatus,
  }) {
    emit(
      state.copyWith(
        formzSubmissionStatus:
            formzSubmissionStatus ?? _validateForm(signUpReq: state.signUpReq),
      ),
    );
  }

  void emitCustomFailure({
    required Emitter<SignUpState> emit,
    required ErrorInfo apiErrorModel,
  }) {
    return emit(SignUpState.failure(apiError: apiErrorModel));
  }

  FormzSubmissionStatus _validateForm({required SignUpReqEntity signUpReq}) {
    return (Formz.validate([
              signUpReq.name ?? const GenericFormInput.pure(),
              signUpReq.email ?? const EmailFormInput.pure(),
              signUpReq.password ?? const PasswordFormInput.pure(),
            ]) &&
            (signUpReq.isValidNumber ?? false) &&
            signUpReq.confirmPassword?.value == signUpReq.password?.value)
        ? FormzSubmissionStatus.success
        : FormzSubmissionStatus.failure;
  }
}
