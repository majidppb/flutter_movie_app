import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/core/language_map.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:movie_app/domain/library/my_list/my_list_reposiory.dart';
import 'package:movie_app/domain/movie_details/models/movie/movie.dart';
import 'package:movie_app/presentation/core/widgets/video.dart';
import 'package:movie_app/presentation/core/widgets/video_action.dart';
import 'package:share_plus/share_plus.dart';

// Main Widget
class Watch extends StatelessWidget {
  final Movie _movie;

  const Watch({super.key, required Movie movie}) : _movie = movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Show Backdrop Image or Poster Image if avilable
        LimitedBox(
            maxHeight: MediaQuery.of(context).size.height * 0.6,
            child: VideoWidget(
                backdrop: _movie.backdropPath, poster: _movie.posterPath)),

        // Movie Actions : Share, MyList, Play
        _Actions(movie: _movie),
      ],
    );
  }
}

// Sub widget
class _Actions extends StatelessWidget {
  final Movie _movie;

  // Value Notifier to know whether the movie is in MyList
  final ValueNotifier<bool> _isInMyList = ValueNotifier(false);

  _Actions({
    required Movie movie,
  }) : _movie = movie;

  @override
  Widget build(BuildContext context) {
    _getIsInMyList(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Share
        VideoActionGreyWidget(
          icon: Icons.share,
          title: 'Share',
          onPressed: () {
            Share.share(
              _getMovieShareDetails(),
              subject: 'Movie : ${_movie.title}',
            );
          },
        ),

        // MyList : Add / Remove
        ValueListenableBuilder(
          valueListenable: _isInMyList,
          builder: _myListButton,
        ),

        // Play
        const VideoActionGreyWidget(
            icon: Icons.play_arrow_rounded, title: 'Play'),
      ],
    );
  }

  VideoActionGreyWidget _myListButton(
      BuildContext context, bool isInMyList, _) {
    if (isInMyList) {
      // if movie is already in my list, then show Remove Button
      return VideoActionGreyWidget(
        icon: Icons.playlist_remove_rounded,
        title: 'My List',
        onPressed: () async {
          await RepositoryProvider.of<MyListRepository>(context)
              .deleteItem(_movie.id);
          // Set value notifier to false
          _isInMyList.value = false;
        },
      );
    } else {
      // If movie is not in my list, then show Add Button
      return VideoActionGreyWidget(
        icon: Icons.playlist_add_rounded,
        title: 'My List',
        onPressed: () async {
          await RepositoryProvider.of<MyListRepository>(context)
              .insertItem(_movie);
          // Set value notifier to true
          _isInMyList.value = true;
        },
      );
    }
  }

  // Whether already addded to My List
  Future<void> _getIsInMyList(BuildContext context) async {
    _isInMyList.value = await RepositoryProvider.of<MyListRepository>(context)
        .isInMyList(_movie.id);
  }

  // The Movie Details For Sharing
  String _getMovieShareDetails() {
    final title = _movie.title == _movie.originalTitle
        ? '${_movie.title}\n'
        : '${_movie.title}\n${_movie.originalTitle}\n';
    final lang =
        'Original Language : ${languageMap[_movie.originalLanguage]}\n';
    final releasedOn = 'Released on ${_movie.releaseDate}\n';
    final overview = '${_movie.overview}\n';
    final movie = 'movieapp.com${Routes.movieDetailsPath}${_movie.id}';
    return '$title\n$lang$releasedOn\n$overview\n$movie';
  }
}
