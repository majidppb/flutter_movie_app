part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required bool isIdleLoading,
    required bool isIdleError,
    int? searchNextPage,
    bool? isSearchError,
    List<Movie>? searchResultList,
    required List<Movie> idleList,
  }) = _SearchState;

  factory SearchState.initial() => const SearchState(
        isIdleLoading: false,
        isIdleError: false,
        idleList: [],
      );
}
