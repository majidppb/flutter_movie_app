import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/movie_details/models/movie/movie.dart';
import 'package:movie_app/domain/movie_details/movie_details_service.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';
part 'movie_details_bloc.freezed.dart';

@injectable
class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final MovieDetailsLocalService _localService;
  final MovieDetailsRemoteService _remoteService;
  MovieDetailsBloc(this._localService, this._remoteService)
      : super(MovieDetailsState.initial()) {
    on<_GetMovie>((event, emit) async {
      // Initial State : isLoading = true

      // Check whethe movie was passed
      if (event.movie != null) {
        emit(MovieDetailsState(
            isLoading: false, isError: false, movie: event.movie));
        return;
      }

      // Check for movie in local database
      final localResult = await _localService.getMovie(event.id);
      if (localResult != null) {
        emit(MovieDetailsState(
            isLoading: false, isError: false, movie: localResult));
        return;
      }

      // Get Movie from web api
      final remoteResult = await _remoteService.getMovie(event.id);

      remoteResult.fold(
          (failure) =>
              emit(const MovieDetailsState(isLoading: false, isError: true)),
          (movie) => emit(MovieDetailsState(
              isLoading: false, isError: false, movie: movie)));
    });
  }
}
