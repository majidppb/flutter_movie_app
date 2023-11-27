import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/home/home_service.dart';
import 'package:movie_app/domain/movie_details/models/movie/movie.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeService _homeService;

  HomeBloc(this._homeService) : super(HomeState.initial()) {
    on<_GetTopRated>((event, emit) async {
      // If Top Rated List is already loaded
      if (state.topRated.isNotEmpty) {
        emit(
          state.copyWith(
            isTopRatedLoading: false,
            isTopRatedError: false,
          ),
        );
        return;
      }

      // Show loading in UI
      emit(
        state.copyWith(
          isTopRatedLoading: true,
          isTopRatedError: false,
        ),
      );

      // Get data from api
      final result = await _homeService.getTopRated();

      // show to UI
      emit(result.fold(
          (failure) => state.copyWith(
                isTopRatedLoading: false,
                isTopRatedError: true,
              ), (movieList) {
        return state.copyWith(
            isTopRatedLoading: false,
            isTopRatedError: false,
            topRated: movieList);
      }));
    });

    on<_GetReleasedInPastYear>((event, emit) async {
      // If Released In Past Year List is already loaded
      if (state.releasedInPastYear.isNotEmpty) {
        emit(
          state.copyWith(
            isReleasedInPastYearLoading: false,
            isReleasedInPastYearError: false,
          ),
        );
        return;
      }
      // Show loading in UI
      emit(
        state.copyWith(
          isReleasedInPastYearLoading: true,
          isReleasedInPastYearError: false,
        ),
      );

      // getdata from api
      final result = await _homeService.getReleasedInPastYear();

      // show to UI
      emit(result.fold(
          (failure) => state.copyWith(
                isReleasedInPastYearLoading: false,
                isReleasedInPastYearError: true,
              ),
          (movieList) => state.copyWith(
              isReleasedInPastYearLoading: false,
              isReleasedInPastYearError: false,
              releasedInPastYear: movieList)));
    });
  }
}
