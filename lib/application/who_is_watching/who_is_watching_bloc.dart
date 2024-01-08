import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/di/injectable.dart';
import 'package:movie_app/domain/who_is_watching/models/profile/profile.dart';
import 'package:movie_app/domain/who_is_watching/profile_service.dart';
import 'package:movie_app/infrastructure/core/shared_prefs.dart';

part 'who_is_watching_event.dart';
part 'who_is_watching_state.dart';
part 'who_is_watching_bloc.freezed.dart';

@injectable
class WhoIsWatchingBloc extends Bloc<WhoIsWatchingEvent, WhoIsWatchingState> {
  final ProfileService _profileService;

  WhoIsWatchingBloc(this._profileService)
      : super(WhoIsWatchingState.initial()) {
    on<_Initial>((event, emit) async {
      final profiles = await _profileService.getProfiles();
      // New User : if no profile is available create one
      if (profiles.isEmpty) {
        final newProfile = Profile(name: 'User', isExplicitAllowed: false);
        await _profileService.insertProfile(newProfile);
        profiles.addAll(await _profileService.getProfiles());
      }
      emit(WhoIsWatchingState(profiles: profiles));
    });

    // Set Current user profile
    on<_SetProfile>((event, emit) {
      final Profile profile = event.profile;
      final prefs = getIt<SharedPrefs>();

      prefs.setCurrentProfile(profile.id!);
      prefs.setName(profile.name);
      prefs.setIsExplicitAllowed(profile.isExplicitAllowed);
    });
  }
}
