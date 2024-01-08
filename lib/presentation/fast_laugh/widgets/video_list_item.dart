import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/domain/fast_laughs/models/fast_laughs_video/fast_laughs_video.dart';
import 'package:movie_app/presentation/core/widgets/loading_indicator.dart';
import 'package:movie_app/presentation/core/widgets/video_action.dart';
import 'package:video_player/video_player.dart';

import '../../core/navbar/screen_navbar.dart';

double _volume = 0;

// Video List Item Widget
class VideoListItemWidget extends StatelessWidget {
  const VideoListItemWidget({super.key, required FastLaughsVideo video})
      : _video = video;
  final FastLaughsVideo _video;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _VideoPlayer(_video.videoUrl!),
        _FloatingItems(video: _video),
      ],
    );
  }
}

// Floating Items over the video
class _FloatingItems extends StatelessWidget {
  const _FloatingItems({
    required FastLaughsVideo video,
  }) : _video = video;

  final FastLaughsVideo _video;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 100, right: 30),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.transparent,
              backgroundImage: CachedNetworkImageProvider(_video.thumbnailUrl!),
            ),
            const VideoActionWidget(
              icon: Icons.emoji_emotions,
              title: 'LOL',
            ),
            const VideoActionWidget(
              icon: Icons.add,
              title: 'My List',
            ),
            const VideoActionWidget(
              icon: Icons.share,
              title: 'Share',
            ),
            const VideoActionWidget(
              icon: Icons.play_arrow,
              title: 'Play',
            ),
          ],
        ),
      ),
    );
  }
}

// Video Player Widget
class _VideoPlayer extends StatefulWidget {
  final String _videoUrl;

  const _VideoPlayer(String videoUrl) : _videoUrl = videoUrl;

  @override
  State<_VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<_VideoPlayer> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget._videoUrl))
          ..initialize().then((_) {
            setState(() {});
            _videoPlayerController.play();
          });

    // Controlling the video when screen changes
    navBarIndex.addListener(_onScreenChange);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _videoPlayerController.value.isInitialized
        ? GestureDetector(
            onTap: _toggleVolume,
            onLongPressDown: _pauseVideo,
            onLongPressCancel: _playVideo,
            onLongPressUp: _playVideo,
            child: Center(
              child: AspectRatio(
                  aspectRatio: _videoPlayerController.value.aspectRatio,
                  child: VideoPlayer(_videoPlayerController)),
            ),
          )
        : const LoadingIndicatorWidget();
  }

  @override
  void dispose() {
    navBarIndex.removeListener(_onScreenChange);
    _videoPlayerController.dispose();
    super.dispose();
  }

  void _toggleVolume() {
    if (_videoPlayerController.value.volume != 0) {
      _volume = _videoPlayerController.value.volume;
      _videoPlayerController.setVolume(0);
    } else {
      _videoPlayerController.setVolume(_volume);
    }
  }

  void _pauseVideo(_) {
    _videoPlayerController.pause();
  }

  void _playVideo() {
    _videoPlayerController.play();
  }

  void _onScreenChange() {
    if (navBarIndex.value == 2) {
      _playVideo();
    } else {
      _pauseVideo(null);
    }
  }
}
