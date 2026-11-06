part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.getProfile() = _GetProfile;
  const factory ProfileEvent.dataChanged({
    required ProfileEntity? updatedProfile,
  }) = _DataChanged;
  const factory ProfileEvent.updateProfile() = _UpdateProfile;
}
