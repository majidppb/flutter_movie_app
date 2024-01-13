import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/domain/fast_laughs/models/fast_laughs_video/fast_laughs_video.dart';
import 'package:movie_app/presentation/core/widgets/loading_indicator.dart';
import 'package:movie_app/presentation/core/widgets/video_action.dart';
import 'package:video_player/video_player.dart';

import '../../core/navbar/screen_navbar.dart';

class FastLaughsWidget extends StatelessWidget {
  const FastLaughsWidget({super.key, required FastLaughsVideo video})
      : _video = video;
  final FastLaughsVideo _video;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _Video(_video.videoUrl!),
        _OverTheVideoItems(video: _video),
      ],
    );
  }
}

class _OverTheVideoItems extends StatelessWidget {
  const _OverTheVideoItems({
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

double _volume = 0;

class _Video extends StatefulWidget {
  final String _videoUrl;

  const _Video(String videoUrl) : _videoUrl = videoUrl;

  @override
  State<_Video> createState() => _VideoState();
}

class _VideoState extends State<_Video> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget._videoUrl))
      ..initialize().then((_) {
        setState(() {
          _controller.setLooping(true);
          _playVideo();
        });
      });

    // Controlling the video when screen changes
    navBarIndex.addListener(_onScreenChange);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? GestureDetector(
            onTap: _toggleVolume,
            onLongPressDown: (_) => _pauseVideo(),
            onLongPressCancel: _playVideo,
            onLongPressUp: _playVideo,
            child: Center(
              child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller)),
            ),
          )
        : const LoadingIndicatorWidget();
  }

  @override
  void dispose() {
    navBarIndex.removeListener(_onScreenChange);
    _controller.dispose();
    super.dispose();
  }

  void _toggleVolume() {
    if (_controller.value.volume != 0) {
      _volume = _controller.value.volume;
      _controller.setVolume(0);
    } else {
      _controller.setVolume(_volume);
    }
  }

  void _pauseVideo() {
    _controller.pause();
  }

  void _playVideo() {
    _controller.play();
  }

  void _onScreenChange() {
    if (navBarIndex.value == 2) {
      _playVideo();
    } else {
      _pauseVideo();
    }
  }
}
