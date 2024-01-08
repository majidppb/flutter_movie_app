import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/who_is_watching/profile_service.dart';
import 'package:movie_app/infrastructure/core/shared_prefs.dart';

import '../../domain/who_is_watching/models/profile/profile.dart';
import 'profile_edit_mode.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';
part 'edit_profile_bloc.freezed.dart';

@injectable
class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  final SharedPrefs _prefs;
  final ProfileService _profileService;

  EditProfileBloc(this._profileService, this._prefs)
      : super(EditProfileState.initial()) {
    on<_Initial>((event, emit) {
      if (event.mode == ProfileEditMode.add) {
        return;
      }
      // If the mode is edit mode, then load the current details
      emit(EditProfileState(name: _prefs.getName));
    });

    on<_Save>((event, emit) {
      if (event.mode == ProfileEditMode.add) {
        // Create New
        final profile = Profile(name: event.name, isExplicitAllowed: false);
        _profileService.insertProfile(profile);
      } else {
        final profile = Profile(
          id: _prefs.getCurrentProfile,
          name: event.name,
          isExplicitAllowed: _prefs.getIsExplicitAllowed,
        );
        _profileService.updateProfile(profile);
        _prefs.setName(event.name);
      }
    });
  }
}
