import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:movie_app/core/colors.dart';
import 'package:movie_app/domain/core/functions/image_path.dart';
import 'package:movie_app/domain/core/my_app_router/my_app_router.dart';
import 'package:movie_app/domain/core/my_app_router/my_app_router_constatnts.dart';
import 'package:movie_app/domain/movie_details/models/movie/movie.dart';
import 'package:movie_app/presentation/widgets/loading_indicator.dart';

class VerticalMovieTile extends StatelessWidget {
  final Movie _movie;
  const VerticalMovieTile({
    super.key,
    required Movie movie,
  }) : _movie = movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.shortestSide;

    return GestureDetector(
      onTap: () {
        MyAppRouter.router.push(
            '${MyAppRouterConstatnts.movieDetailsPath}${_movie.id}',
            extra: _movie);
      },
      child: ClipRRect(
          borderRadius: BorderRadius.circular(4.5),
          child: (_movie.posterPath != null)
              ? CachedNetworkImage(
                  imageUrl: imagePath(_movie.posterPath!),
                  width: size * 0.325,
                  height: size * 0.47,
                  placeholder: (_, __) => const LoadingTextWidget(),
                  errorWidget: (_, __, ___) =>
                      VerticalMovieError(title: _movie.title),
                  cacheManager: CacheManager(
                    Config(
                      'VerticalMovieTile',
                      stalePeriod: const Duration(days: 1),
                    ),
                  ),
                )
              : VerticalMovieError(title: _movie.title)),
    );
  }
}

// Error Widget
class VerticalMovieError extends StatelessWidget {
  const VerticalMovieError({
    super.key,
    required String title,
  }) : _title = title;

  final String _title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        _title,
        style: const TextStyle(
          color: kGreyColor,
        ),
      ),
    );
  }
}
