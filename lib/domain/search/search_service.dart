import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/core/failures/main_failure.dart';
import 'package:movie_app/domain/movie_details/models/movie/movie.dart';
import 'package:movie_app/domain/search/models/api_response/api_response.dart';

abstract class SearchService {
  Future<Either<MainFailure, ApiResponse>> searchMovies(
      {required String movieQuery, required int page});
  Future<Either<MainFailure, List<Movie>>> getTrending();
}
