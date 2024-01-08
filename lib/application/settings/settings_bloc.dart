import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/who_is_watching/models/profile/profile.dart';
import 'package:movie_app/domain/who_is_watching/profile_service.dart';
import 'package:movie_app/infrastructure/core/shared_prefs.dart';

import '../../domain/library/my_list/my_list_service.dart';

part 'settings_event.dart';
part 'settings_state.dart';
part 'settings_bloc.freezed.dart';

@injectable
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SharedPrefs _prefs;
  final ProfileService _profileService;
  final MyListService _myListService;

  SettingsBloc(this._myListService, this._profileService, this._prefs)
      : super(SettingsState.initial()) {
    on<_GetSettings>((event, emit) async {
      emit(
        SettingsState(
            // Name
            name: _prefs.getName,
            // isExplicitAllowed
            isExplicitAllowed: _prefs.getIsExplicitAllowed),
      );
    });
    on<_SaveSettings>(
      (event, emit) async {
        // New instance with updated settings
        final profile = Profile(
            name: _prefs.getName, isExplicitAllowed: event.isExplicitAllowed);
        // Update to db
        await _profileService.updateProfile(profile);
        // Update to Shared Preferences
        await _prefs.setIsExplicitAllowed(event.isExplicitAllowed);

        emit(state.copyWith(isExplicitAllowed: event.isExplicitAllowed));
      },
    );
    on<_LogOut>(
      (event, emit) {
        _prefs.clear();
        _myListService.clear();
        _profileService.clear();
      },
    );
  }
}
