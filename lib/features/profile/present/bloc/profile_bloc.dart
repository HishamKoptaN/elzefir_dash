import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/errors/models/error_info.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/services/pusher_service.dart';
import '../../domain/entities/profile_entity.dart';
import '../../domain/entities/update_profile_req_entity.dart';
import '../../domain/use_cases/profile_use_cases.dart';
part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

@singleton
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileUseCases _profileUseCases;

  ProfileBloc(this._profileUseCases) : super(const ProfileState.init()) {
    on<ProfileEvent>((event, emit) async {
      await event.when(
        getProfile: () async {
          emit(
            ProfileState.loaded(
              profile: ProfileEntity(),
              updatedProfile: null,
              isLoading: true,
            ),
          );
          final res = await _profileUseCases.getProfile();
          await res.when(
            success: (profile) {
              getIt<PusherService>().subscribeUser(
                userId: profile?.id.toString() ?? '',
              );
              emit(
                ProfileState.loaded(
                  profile: profile ?? ProfileEntity(),
                  updatedProfile: null,
                ),
              );
            },
            failure: (apiErrorModel) {
              emit(ProfileState.failure(apiErrorModel: apiErrorModel));
            },
          );
        },
        dataChanged: (updatedProfile) {
          state.mapOrNull(
            loaded: (state) {
              emit(state.copyWith(updatedProfile: updatedProfile));
            },
          );
        },
        updateProfile: () async {
          await state.mapOrNull(
            loaded: (state) async {
              _emitCustomLoaded(
                emit: emit,
                state: state,
                formzSubmissionStatus: FormzSubmissionStatus.inProgress,
              );
              final result = await _profileUseCases.updateProfile(
                updateProfileReqEntity: UpdateProfileReqEntity(
                  id: state.profile.id,
                  avatar: state.updatedProfile?.selectedImage,
                  name: state.updatedProfile?.name?.value,
                  username: state.updatedProfile?.username?.value,
                  phoneNumber: state.updatedProfile?.phoneNumber?.value,
                  dialCode: state.updatedProfile?.dialCode?.value,
                  isoCode: state.updatedProfile?.isoCode?.value,
                ),
              );
              await result.when(
                success: (profile) {
                  emit(const ProfileState.success());
                  _emitCustomLoaded(
                    emit: emit,
                    state: state.copyWith(
                      profile: profile!,
                      updatedProfile: null,
                    ),
                  );
                },
                failure: (apiErrorModel) {
                  emit(ProfileState.failure(apiErrorModel: apiErrorModel));
                  _emitCustomLoaded(emit: emit, state: state);
                },
              );
            },
          );
        },
      );
    });
  }
  void _emitCustomLoaded({
    required Emitter<ProfileState> emit,
    required _Loaded state,
    FormzSubmissionStatus? formzSubmissionStatus,
  }) {
    emit(
      state.copyWith(
        formzSubmissionStatus: valiadte(
          formzSubmissionStatus: formzSubmissionStatus,
          originalProfile: state.profile,
          updatedProfile: state.updatedProfile ?? ProfileEntity(),
        ),
      ),
    );
  }

  void emitCustomFailure({
    required Emitter<ProfileState> emit,
    required ErrorInfo apiErrorModel,
  }) {
    return emit(ProfileState.failure(apiErrorModel: apiErrorModel));
  }

  FormzSubmissionStatus valiadte({
    required FormzSubmissionStatus? formzSubmissionStatus,
    required ProfileEntity originalProfile,
    required ProfileEntity updatedProfile,
  }) {
    if (formzSubmissionStatus != null) return formzSubmissionStatus;
    final bool isNameValid = Formz.validate([
      updatedProfile.name ?? const GenericFormInput.pure(),
    ]);
    final bool isUserNameValid = Formz.validate([
      updatedProfile.username ?? const GenericFormInput.pure(),
    ]);
    final bool isPhoneChanged =
        updatedProfile.phoneNumber?.value.trim() !=
        originalProfile.phoneNumber?.value.trim();
    final bool isPhoneValid = isPhoneChanged
        ? (updatedProfile.isValidNumber == true)
        : true;
    final bool hasChanges = updatedProfile.isEdited(original: originalProfile);
    return (isNameValid && isUserNameValid && isPhoneValid && hasChanges)
        ? FormzSubmissionStatus.success
        : FormzSubmissionStatus.initial;
  }
}
