part of 'edit_profile_bloc.dart';

@freezed
class EditProfileEvent with _$EditProfileEvent {
  const factory EditProfileEvent.initial(ProfileEditMode mode) = _Initial;
  const factory EditProfileEvent.save(ProfileEditMode mode, String name) =
      _Save;
}
