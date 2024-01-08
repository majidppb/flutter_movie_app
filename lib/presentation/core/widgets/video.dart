import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:movie_app/presentation/core/styles.dart';
import 'package:movie_app/presentation/core/image_path.dart';

class VideoWidget extends StatelessWidget {
  final String? _backdrop;
  final String? _poster;
  const VideoWidget(
      {super.key, required String? backdrop, required String? poster})
      : _backdrop = backdrop,
        _poster = poster;

  @override
  Widget build(BuildContext context) {
    // Display Backdrop image if avilable
    if (_backdrop != null) {
      return Stack(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: CachedNetworkImage(
              imageUrl: imagePath(_backdrop!),
              cacheManager: CacheManager(
                Config(
                  'VideoWidget',
                  stalePeriod: const Duration(days: 1),
                ),
              ),
            ),
          ),
          const Positioned(
              right: 10, bottom: 10, child: Icon(Icons.volume_off_rounded))
        ],
      );
    }
    // If not, display Poster image if available
    else if (_poster != null) {
      return Center(
        child: Image.network(
          imagePath(imagePath(_poster!)),
          width: double.infinity,
        ),
      );
    }
    return kHeight20;
  }
}
