import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/domain/core/api_end_points.dart';
import 'package:movie_app/domain/core/di/injectable.dart';
import 'package:movie_app/domain/core/failures/main_failure.dart';
import 'package:movie_app/domain/home/home_service.dart';
import 'package:movie_app/domain/movie_details/models/movie/movie.dart';
import 'package:movie_app/infrastructure/dio_provider.dart';
import 'package:movie_app/infrastructure/shared_prefs.dart';

@LazySingleton(as: HomeService)
class HomeImpl implements HomeService {
  @override
  Future<Either<MainFailure, List<Movie>>> getReleasedInPastYear() async {
    try {
      final isExplictAllowed = getIt<SharedPrefs>().getIsExplicitAllowed;

      final response = await DioProvider.dio.get(
        ApiEndPoints.releasedInPastYear,
        queryParameters: {
          'include_adult': isExplictAllowed,
          // Start date
          'primary_release_date.gte': DateFormat('yyyy-MM-dd')
              .format(DateTime.now().subtract(const Duration(days: 365))),
          // End date
          'primary_release_date.lte':
              DateFormat('yyyy-MM-dd').format(DateTime.now()),
          'language': 'en-US'
        },
      );

      if (response.statusCode == 200) {
        final result = (response.data['results'] as List)
            .map((movie) => Movie.fromJson(movie))
            .toList();

        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (_) {
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, List<Movie>>> getTopRated() async {
    try {
      final response = await DioProvider.dio
          .get(ApiEndPoints.topRated, queryParameters: {'language': 'en-US'});
      if (response.statusCode == 200) {
        final result = (response.data['results'] as List)
            .map((movie) => Movie.fromJson(movie))
            .toList();
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (_) {
      return const Left(MainFailure.clientFailure());
    }
  }
}
