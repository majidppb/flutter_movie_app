import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/core/failures/main_failure.dart';
import 'package:movie_app/domain/fast_laughs/models/fast_laughs_video/fast_laughs_video.dart';

abstract class FastLaughsVideosService {
  Future<Either<MainFailure, List<FastLaughsVideo>>> getVideos(
      {required int page});
}
