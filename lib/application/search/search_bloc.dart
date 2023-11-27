import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/movie_details/models/movie/movie.dart';
import 'package:movie_app/domain/search/search_service.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchService _searchService;

  SearchBloc(this._searchService) : super(SearchState.initial()) {
    // Idle
    on<_Initialize>(
      (event, emit) async {
        // Idle List items are already available
        if (state.idleList.isNotEmpty) {
          emit(SearchState(
              isIdleLoading: false,
              isIdleError: false,
              idleList: state.idleList));
          return;
        }

        // Show loading in UI
        emit(
          const SearchState(
            isIdleLoading: true,
            isIdleError: false,
            idleList: [],
          ),
        );

        // get trending
        final result = await _searchService.getTrending();

        // show to UI
        emit(
          result.fold(
            (failure) {
              return state.copyWith(
                isIdleLoading: false,
                isIdleError: true,
                idleList: [],
              );
            },
            (movieList) {
              return state.copyWith(
                isIdleLoading: false,
                isIdleError: false,
                idleList: movieList,
              );
            },
          ),
        );
      },
    );

    // Search Result
    on<_SearchMovie>(
      (event, emit) async {
        // New Search : clear old results
        if (event.page == 1) {
          emit(
            state.copyWith(
              isSearchError: null,
              searchResultList: null,
            ),
          );
        }

        // call search movie api
        final result = await _searchService.searchMovies(
            movieQuery: event.searchQuery, page: event.page);

        // show to UI
        emit(
          result.fold(
            (failure) => state.copyWith(isSearchError: true),
            (response) => state.copyWith(
              isSearchError: null,
              // check if there is remaining items to load
              searchNextPage:
                  (event.page < response.totalPages) ? event.page + 1 : null,
              // if no items found, return an empty list
              searchResultList: (response.totalPages != 0)
                  ? [...state.searchResultList ?? [], ...response.results]
                  : [],
            ),
          ),
        );
      },
    );
  }
}
