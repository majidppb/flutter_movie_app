part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required bool isTopRatedLoading,
    required bool isTopRatedError,
    required List<Movie> topRated,
    required bool isReleasedInPastYearLoading,
    required bool isReleasedInPastYearError,
    required List<Movie> releasedInPastYear,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState(
      isTopRatedLoading: true,
      isTopRatedError: false,
      topRated: [],
      isReleasedInPastYearLoading: true,
      isReleasedInPastYearError: false,
      releasedInPastYear: []);
}
