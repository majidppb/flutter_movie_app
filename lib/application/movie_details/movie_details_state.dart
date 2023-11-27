part of 'movie_details_bloc.dart';

@freezed
class MovieDetailsState with _$MovieDetailsState {
  const factory MovieDetailsState(
      {required bool isLoading,
      required bool isError,
      Movie? movie}) = _MovieDetatilsState;
  factory MovieDetailsState.initial() =>
      const MovieDetailsState(isLoading: true, isError: false);
}
