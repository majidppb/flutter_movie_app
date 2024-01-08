import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/infrastructure/core/api_end_points.dart';
import 'package:movie_app/domain/core/failures/main_failure.dart';
import 'package:movie_app/domain/movie_details/models/movie/movie.dart';
import 'package:movie_app/domain/movie_details/movie_details_service.dart';
import 'package:movie_app/infrastructure/core/dio_provider.dart';

@LazySingleton(as: MovieDetailsService)
class MovieDetailsRemoteImpl implements MovieDetailsService {
  @override
  Future<Either<MainFailure, Movie>> getMovie(int id) async {
    try {
      final response = await DioProvider.dio.get('${ApiEndPoints.movie}$id');
      if (response.statusCode == 200) {
        final Map<String, dynamic> result = response.data;

        // Converting to Movie Model Compatible
        result['genre_ids'] = (result['genres'] as List)
            .map((genre) => (genre as Map)['id'] as int)
            .toList();

        return Right(Movie.fromJson(result));
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (_) {
      return const Left(MainFailure.clientFailure());
    }
  }
}
