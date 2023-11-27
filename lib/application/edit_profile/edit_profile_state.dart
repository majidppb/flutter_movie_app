part of 'edit_profile_bloc.dart';

@freezed
class EditProfileState with _$EditProfileState {
  const factory EditProfileState({required String name}) = _EditProfileState;
  factory EditProfileState.initial() => const EditProfileState(name: '');
}
