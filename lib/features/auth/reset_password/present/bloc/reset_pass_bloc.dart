import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/networking/api_result.dart';
import '../../domain/entities/reset_pass_entity.dart';
import '../../domain/usecases/reset_pass_usecases.dart';

part 'reset_pass_bloc.freezed.dart';
part 'reset_pass_event.dart';
part 'reset_pass_state.dart';

@lazySingleton
class ResetPassBloc extends Bloc<ResetPassEvent, ResetPassState> {
  final ResetPassUseCases resetPassUseCase;

  ResetPassBloc(this.resetPassUseCase)
    : super(
        const ResetPassState.loaded(
          resetPassEntity: ResetPassEntity(),
          formzSubmissionStatus: FormzSubmissionStatus.initial,
        ),
      ) {
    on<ResetPassEvent>((event, emit) async {
      await event.when(
        dataChanged: (resetPassEntity) async {
          _emitCustomLoaded(emit: emit, resetPassEntity: resetPassEntity);
        },
        resetPass: () async {
          await state.mapOrNull(
            loaded: (state) async {
              _emitCustomLoaded(
                emit: emit,
                resetPassEntity: state.resetPassEntity,
                formzSubmissionStatus: FormzSubmissionStatus.inProgress,
              );
              final res = await resetPassUseCase.resetPass(
                oldPassword: state.resetPassEntity.oldPassword?.value ?? '',
                newPassword: state.resetPassEntity.newPassword?.value ?? '',
              );
              await res.when(
                success: (_) {
                  emit(const ResetPassState.success());
                  _emitCustomLoaded(
                    emit: emit,
                    formzSubmissionStatus: FormzSubmissionStatus.initial,
                  );
                },
                failure: (e) {
                  emit(ResetPassState.failure(e.toString()));
                  _emitCustomLoaded(
                    emit: emit,
                    formzSubmissionStatus: FormzSubmissionStatus.initial,
                  );
                },
              );
            },
          );
        },
      );
    });
  }
  void _emitCustomLoaded({
    required Emitter<ResetPassState> emit,
    ResetPassEntity? resetPassEntity,
    FormzSubmissionStatus? formzSubmissionStatus,
  }) {
    emit(
      ResetPassState.loaded(
        resetPassEntity: resetPassEntity ?? ResetPassEntity(),
        formzSubmissionStatus:
            formzSubmissionStatus ??
            (Formz.validate([
                  resetPassEntity?.oldPassword ??
                      const PasswordFormInput.pure(),
                  resetPassEntity?.newPassword ??
                      const PasswordFormInput.pure(),
                  ConfirmPasswordFormInput.dirty(
                    value: resetPassEntity?.confirmPassword?.value ?? '',
                    password: resetPassEntity?.newPassword?.value ?? '',
                  ),
                ])
                ? FormzSubmissionStatus.success
                : FormzSubmissionStatus.failure),
      ),
    );
  }
}
