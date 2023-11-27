import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/core/failures/main_failure.dart';
import 'package:movie_app/domain/fast_laughs/get_videos_service.dart';
import 'package:movie_app/domain/fast_laughs/models/fast_laughs_video/fast_laughs_video.dart';

// Uses Dummy Data
// Does not take any value from server
// Need to call an api and replace the values

@LazySingleton(as: FastLaughsVideosService)
class FastLaughsVideosImpl implements FastLaughsVideosService {
  @override
  Future<Either<MainFailure, List<FastLaughsVideo>>> getVideos(
      {required int page}) async {
    final List<FastLaughsVideo> videos =
        (_videos.map((e) => FastLaughsVideo.fromJson(e))).toList();

    // Manipulate a wait
    await Future.delayed(const Duration(seconds: 1));
    return Right(videos);
  }
}

// Dummy Data
// https://gist.github.com/poudyalanil/ca84582cbeb4fc123a13290a586da925
const _videos = [
  {
    "thumbnailUrl":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/Big_Buck_Bunny_thumbnail_vlc.png/1200px-Big_Buck_Bunny_thumbnail_vlc.png",
    "videoUrl":
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
  },
  {
    "thumbnailUrl":
        "https://i.ytimg.com/vi_webp/gWw23EYM9VM/maxresdefault.webp",
    "videoUrl":
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4"
  },
  {
    "thumbnailUrl":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/Big_Buck_Bunny_thumbnail_vlc.png/1200px-Big_Buck_Bunny_thumbnail_vlc.png",
    "videoUrl":
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4"
  }
];
