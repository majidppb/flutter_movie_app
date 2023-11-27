import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/application/search/search_bloc.dart';
import 'package:movie_app/core/constants.dart';
import 'package:movie_app/domain/movie_details/models/movie/movie.dart';
import 'package:movie_app/presentation/widgets/heading_widget.dart';
import 'package:movie_app/presentation/widgets/vertical_movie_tile.dart';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ScreenSearchResults extends StatefulWidget {
  final String _searchQuery;
  const ScreenSearchResults({super.key, required searchQuery})
      : _searchQuery = searchQuery;

  @override
  State<ScreenSearchResults> createState() => _ScreenSearchResultsState();
}

class _ScreenSearchResultsState extends State<ScreenSearchResults> {
  final PagingController<int, Movie> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      BlocProvider.of<SearchBloc>(context).add(SearchEvent.searchMovie(
          searchQuery: widget._searchQuery, page: pageKey));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return BlocListener<SearchBloc, SearchState>(
      listener: (_, state) {
        _pagingController.value = PagingState(
          nextPageKey: state.searchNextPage,
          itemList: state.searchResultList,
          error: state.isSearchError,
        );
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: kPadding10,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // Heading
              HeadingWidget(title: "Results for '${widget._searchQuery}'"),
              kHeight,

              // GridView
              Expanded(
                child: PagedGridView<int, Movie>(
                  pagingController: _pagingController,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    // Main Card Ratio
                    childAspectRatio: 0.325 / 0.47,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    crossAxisCount: isPortrait ? 3 : 5,
                  ),
                  builderDelegate: PagedChildBuilderDelegate<Movie>(
                    itemBuilder: (_, movie, __) =>
                        VerticalMovieTile(movie: movie),
                    noItemsFoundIndicatorBuilder: (_) =>
                        const Text('No items found !'),
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
