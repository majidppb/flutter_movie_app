import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/fast_laughs/get_videos_service.dart';
import 'package:movie_app/domain/fast_laughs/models/fast_laughs_video/fast_laughs_video.dart';

part 'fast_laughs_event.dart';
part 'fast_laughs_state.dart';
part 'fast_laughs_bloc.freezed.dart';

@injectable
class FastLaughsBloc extends Bloc<FastLaughsEvent, FastLaughsState> {
  final FastLaughsVideosService _fastLaughsService;
  FastLaughsBloc(this._fastLaughsService) : super(FastLaughsState.initial()) {
    on<_GetVideos>((event, emit) async {
      // Get Videos
      final result = await _fastLaughsService.getVideos(page: event.page);

      // show to UI
      emit(result.fold(
          (failure) => state.copyWith(isError: true),
          (response) => state.copyWith(
                isError: null,
                nextPage: event.page + 1,
                videos: [...state.videos ?? [], ...response],
              )));
    });
  }
}
