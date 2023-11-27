import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:movie_app/domain/core/functions/image_path.dart';
import 'package:movie_app/presentation/widgets/loading_indicator.dart';
import 'package:movie_app/presentation/widgets/vertical_movie_tile.dart';

// For MyList
class VerticalMoviePoster extends StatelessWidget {
  final String _title;
  final String? _posterPath;
  const VerticalMoviePoster({
    super.key,
    required String title,
    required String? posterPath,
  })  : _title = title,
        _posterPath = posterPath;

  @override
  Widget build(BuildContext context) {
    return (_posterPath != null)
        ? CachedNetworkImage(
            imageUrl: imagePath(_posterPath!),
            height: 100,
            width: 50,
            fit: BoxFit.fitHeight,
            placeholder: (_, __) => const LoadingTextWidget(),
            errorWidget: (_, __, ___) => VerticalMovieError(title: _title),
            cacheManager: CacheManager(
              Config(
                'VerticalMovieTile',
                stalePeriod: const Duration(days: 1),
              ),
            ),
          )
        : VerticalMovieError(title: _title);
  }
}
