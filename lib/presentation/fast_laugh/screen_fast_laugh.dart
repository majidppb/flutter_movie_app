import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movie_app/application/fast_laughs/fast_laughs_bloc.dart';
import 'package:movie_app/domain/fast_laughs/models/fast_laughs_video/fast_laughs_video.dart';
import 'package:movie_app/presentation/fast_laugh/widgets/video_list_item.dart';
import 'package:movie_app/presentation/navbar/screen_navbar.dart';

class ScreenFastLaugh extends StatefulWidget {
  const ScreenFastLaugh({super.key});

  @override
  State<ScreenFastLaugh> createState() => _ScreenFastLaughState();
}

class _ScreenFastLaughState extends State<ScreenFastLaugh> {
  final PagingController<int, FastLaughsVideo> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    // Screen Orientation Lock
    navBarIndex.addListener(_onScreenChange);

    _pagingController.addPageRequestListener((pageKey) {
      BlocProvider.of<FastLaughsBloc>(context)
          .add(FastLaughsEvent.getVideos(page: pageKey));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FastLaughsBloc, FastLaughsState>(
      listener: (_, state) {
        _pagingController.value = PagingState(
          nextPageKey: state.nextPage,
          itemList: state.videos,
          error: state.isError,
        );
      },
      child: PagedPageView<int, FastLaughsVideo>(
        pagingController: _pagingController,
        scrollDirection: Axis.vertical,
        builderDelegate: PagedChildBuilderDelegate(
          itemBuilder: (_, video, __) =>
              VideoListItemWidget(key: ObjectKey(video), video: video),
        ),
      ),
    );
  }

  // Screen Orientation Lock
  _onScreenChange() {
    if (navBarIndex.value == 2) {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    } else {
      // Reset preferred orientations to allow any orientation
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }
  }

  @override
  void dispose() {
    // Reset preferred orientations to allow any orientation
    navBarIndex.removeListener(_onScreenChange);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    _pagingController.dispose();
    super.dispose();
  }
}
