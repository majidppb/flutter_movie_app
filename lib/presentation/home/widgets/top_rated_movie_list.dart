import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/application/home/home_bloc.dart';
import 'package:movie_app/presentation/core/styles.dart';
import 'package:movie_app/domain/movie_details/models/movie/movie.dart';
import 'package:movie_app/presentation/core/widgets/custom_error.dart';
import 'package:movie_app/presentation/core/widgets/heading_widget.dart';
import 'package:movie_app/presentation/core/widgets/loading_indicator.dart';
import 'package:movie_app/presentation/core/widgets/vertical_movie_tile.dart';

class TopTenMovieListWidget extends StatelessWidget {
  const TopTenMovieListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10, bottom: 10),
            child: HeadingWidget(title: 'Top Rated Movies'),
          ),
          SizedBox(
            // Vertical Movie Tile height
            height: MediaQuery.of(context).size.shortestSide * 0.47,
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state.isTopRatedLoading) {
                  return const LoadingIndicatorWidget();
                }
                if (state.isTopRatedError) {
                  return const CustomErrorWidget();
                }
                return ListView.separated(
                  padding: kMovieListPadding,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    final movie = state.topRated[index];
                    return _TopTenVerticalMovieTile(
                      movie: movie,
                      index: index,
                    );
                  },
                  separatorBuilder: (ctx, index) => kWidth0,
                  itemCount: state.topRated.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Sub Widget
class _TopTenVerticalMovieTile extends StatelessWidget {
  const _TopTenVerticalMovieTile({required this.index, required Movie movie})
      : _movie = movie;
  final int index;
  final Movie _movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: VerticalMovieTile(movie: _movie),
        ),
        Positioned(
            left: 0, bottom: -19, child: _BorderedText(text: '${index + 1}')),
      ],
    );
  }
}

// Sub Widget
class _BorderedText extends StatelessWidget {
  const _BorderedText({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    // Modified
    // Code : https://api.flutter.dev/flutter/painting/TextStyle-class.html#painting.TextStyle.6
    return Stack(
      children: <Widget>[
        //  text border.
        Text(
          text,
          style: const TextStyle(
            // FONT SIZE
            fontSize: 84,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        // Solid text as fill.
        Text(
          text,
          style: const TextStyle(
            // FONT SIZE
            fontSize: 84,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
