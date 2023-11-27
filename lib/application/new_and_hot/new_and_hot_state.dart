part of 'new_and_hot_bloc.dart';

@freezed
class NewAndHotState with _$NewAndHotState {
  const factory NewAndHotState({
    required bool isComingSoonLoading,
    required bool isComingSoonError,
    required List<Movie> comingSoon,
    required bool isEveryonesWatchingLoading,
    required bool isEveryonesWatchingError,
    required List<Movie> everyonesWatching,
  }) = _NewAndHotState;

  factory NewAndHotState.initial() => const NewAndHotState(
      isComingSoonLoading: false,
      isComingSoonError: false,
      comingSoon: [],
      isEveryonesWatchingLoading: false,
      isEveryonesWatchingError: false,
      everyonesWatching: []);
}
