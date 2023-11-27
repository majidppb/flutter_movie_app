part of 'who_is_watching_bloc.dart';

@freezed
class WhoIsWatchingState with _$WhoIsWatchingState {
  const factory WhoIsWatchingState({
    required List<Profile> profiles,
  }) = _WhoIsWatching;

  factory WhoIsWatchingState.initial() =>
      const WhoIsWatchingState(profiles: []);
}
