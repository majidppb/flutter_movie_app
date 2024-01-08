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
  final MovieDetailsService _remoteService;
  MovieDetailsBloc(this._remoteService) : super(MovieDetailsState.initial()) {
    on<_GetMovie>((event, emit) async {
      // Initial State : isLoading = true

      // Check whether the movie was passed
      if (event.movie != null) {
        emit(MovieDetailsState(
            isLoading: false, isError: false, movie: event.movie));
        return;
      }

      // Get the Movie from web api
      final remoteResult = await _remoteService.getMovie(event.id);

      remoteResult.fold(
          (failure) =>
              emit(const MovieDetailsState(isLoading: false, isError: true)),
          (movie) => emit(MovieDetailsState(
              isLoading: false, isError: false, movie: movie)));
    });
  }
}
