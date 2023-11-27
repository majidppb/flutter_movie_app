import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/core/failures/main_failure.dart';
import 'package:movie_app/domain/movie_details/models/movie/movie.dart';

abstract class HomeService {
  Future<Either<MainFailure, List<Movie>>> getReleasedInPastYear();
  Future<Either<MainFailure, List<Movie>>> getTopRated();
}
