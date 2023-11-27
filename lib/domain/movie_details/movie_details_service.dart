import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/core/failures/main_failure.dart';
import 'package:movie_app/domain/movie_details/models/movie/movie.dart';

abstract class MovieDetailsRemoteService {
  Future<Either<MainFailure, Movie>> getMovie(int id);
}

abstract class MovieDetailsLocalService {
  Future<Movie?> getMovie(int id);
}
