part of 'who_is_watching_bloc.dart';

@freezed
class WhoIsWatchingEvent with _$WhoIsWatchingEvent {
  const factory WhoIsWatchingEvent.initial() = _Initial;
  const factory WhoIsWatchingEvent.setProfile(Profile profile) = _SetProfile;
}
