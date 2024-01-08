import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/infrastructure/core/api_end_points.dart';
import 'package:movie_app/core/di/injectable.dart';
import 'package:movie_app/domain/core/failures/main_failure.dart';
import 'package:movie_app/domain/movie_details/models/movie/movie.dart';
import 'package:movie_app/domain/search/models/api_response/api_response.dart';
import 'package:movie_app/domain/search/search_service.dart';
import 'package:movie_app/infrastructure/core/dio_provider.dart';
import 'package:movie_app/infrastructure/core/shared_prefs.dart';

@LazySingleton(as: SearchService)
class SearchImpl implements SearchService {
  @override
  Future<Either<MainFailure, ApiResponse>> searchMovies(
      {required String movieQuery, required int page}) async {
    try {
      final isExplictAllowed = getIt<SharedPrefs>().getIsExplicitAllowed;

      final response = await DioProvider.dio.get(
        ApiEndPoints.search,
        queryParameters: {
          'query': movieQuery,
          'include_adult': isExplictAllowed,
          'page': page,
          'language': 'en-US'
        },
      );

      if (response.statusCode == 200) {
        final result = ApiResponse.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (_) {
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, List<Movie>>> getTrending() async {
    try {
      final response = await DioProvider.dio
          .get(ApiEndPoints.trending, queryParameters: {'language': 'en-US'});
      if (response.statusCode == 200) {
        final result = (response.data['results'] as List)
            .map((movie) => Movie.fromJson(movie))
            .toList();
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailure.clientFailure());
    }
  }
}
