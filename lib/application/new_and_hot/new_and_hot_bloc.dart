import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/movie_details/models/movie/movie.dart';
import 'package:movie_app/domain/new_and_hot/new_and_hot_service.dart';

part 'new_and_hot_event.dart';
part 'new_and_hot_state.dart';
part 'new_and_hot_bloc.freezed.dart';

@injectable
class NewAndHotBloc extends Bloc<NewAndHotEvent, NewAndHotState> {
  final NewAndHotService _newAndHotService;

  NewAndHotBloc(this._newAndHotService) : super(NewAndHotState.initial()) {
    on<_GetComingSoon>(
      (event, emit) async {
        // If Coming Soon List is already loaded
        if (state.comingSoon.isNotEmpty) {
          emit(
            state.copyWith(
              isComingSoonLoading: false,
              isComingSoonError: false,
            ),
          );
          return;
        }

        // Show loading in UI
        emit(
          state.copyWith(
            isComingSoonLoading: true,
            isComingSoonError: false,
          ),
        );

        // Get items from api
        final result = await _newAndHotService.getComingSoon();

        // Show to UI
        emit(result.fold(
            (failure) => state.copyWith(
                  isComingSoonLoading: false,
                  isComingSoonError: true,
                ),
            (movieList) => state.copyWith(
                isComingSoonLoading: false,
                isComingSoonError: false,
                comingSoon: movieList)));
      },
    );

    on<_GetEveryonesWatching>(
      (event, emit) async {
        // If Everyones Watching List is already loaded
        if (state.everyonesWatching.isNotEmpty) {
          emit(
            state.copyWith(
              isEveryonesWatchingLoading: false,
              isEveryonesWatchingError: false,
            ),
          );
          return;
        }

        // Show loading in UI
        emit(
          state.copyWith(
            isEveryonesWatchingLoading: true,
            isEveryonesWatchingError: false,
          ),
        );

        // get from api
        final result = await _newAndHotService.getEveryonesWatching();

        // show to UI
        emit(
          result.fold(
            (failure) => state.copyWith(
              isEveryonesWatchingLoading: false,
              isEveryonesWatchingError: true,
            ),
            (movieList) => state.copyWith(
              isEveryonesWatchingLoading: false,
              isEveryonesWatchingError: false,
              everyonesWatching: movieList,
            ),
          ),
        );
      },
    );
  }
}
