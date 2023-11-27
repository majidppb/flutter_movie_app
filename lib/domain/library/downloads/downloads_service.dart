import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/core/failures/main_failure.dart';
import 'package:movie_app/domain/library/downloads/models/downloads_image/downloads_image.dart';

abstract class DownloadsService {
  Future<Either<MainFailure, List<DownloadsImage>>> getDownloadsImages();
}
