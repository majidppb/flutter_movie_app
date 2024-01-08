import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/infrastructure/core/api_end_points.dart';
import 'package:movie_app/core/di/injectable.dart';
import 'package:movie_app/domain/core/failures/main_failure.dart';
import 'package:movie_app/domain/movie_details/models/movie/movie.dart';
import 'package:movie_app/domain/new_and_hot/new_and_hot_service.dart';
import 'package:movie_app/infrastructure/core/dio_provider.dart';
import 'package:movie_app/infrastructure/core/shared_prefs.dart';

@LazySingleton(as: NewAndHotService)
class NewAndHotImpl implements NewAndHotService {
  @override
  Future<Either<MainFailure, List<Movie>>> getComingSoon() async {
    try {
      final isExplictAllowed = getIt<SharedPrefs>().getIsExplicitAllowed;

      final response = await DioProvider.dio.get(
        ApiEndPoints.comingSoon,
        queryParameters: {
          'include_adult': isExplictAllowed,
          'primary_release_date.gte':
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
  Future<Either<MainFailure, List<Movie>>> getEveryonesWatching() async {
    try {
      final isExplictAllowed = getIt<SharedPrefs>().getIsExplicitAllowed;
      final response = await DioProvider.dio.get(
        ApiEndPoints.everyonesWatching,
        queryParameters: {
          'include_adult': isExplictAllowed,
          'language': 'en-US'
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
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
