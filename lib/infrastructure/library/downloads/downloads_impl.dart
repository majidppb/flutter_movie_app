import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/core/api_end_points.dart';
import 'package:movie_app/domain/core/failures/main_failure.dart';
import 'package:movie_app/domain/library/downloads/downloads_service.dart';
import 'package:movie_app/domain/library/downloads/models/downloads_image/downloads_image.dart';
import 'package:movie_app/infrastructure/dio_provider.dart';

@LazySingleton(as: DownloadsService)
class DownloadsImpl implements DownloadsService {
  @override
  Future<Either<MainFailure, List<DownloadsImage>>> getDownloadsImages() async {
    try {
      final response = await DioProvider.dio.get(ApiEndPoints.downloadsImages,
          queryParameters: {'language': 'en-US'});

      if (response.statusCode == 200) {
        // Return Poster Paths (DownloadsImage) of Top 3 Movies
        final List<DownloadsImage> result = (response.data['results'] as List)
            .map((movie) => DownloadsImage.fromJson(movie))
            .toList();

        return Right(result.sublist(0, 3));
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailure.clientFailure());
    }
  }
}
