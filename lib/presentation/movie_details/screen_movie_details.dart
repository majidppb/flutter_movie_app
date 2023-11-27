import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/application/movie_details/movie_details_bloc.dart';
import 'package:movie_app/core/colors.dart';
import 'package:movie_app/core/constants.dart';
import 'package:movie_app/core/language_map.dart';
import 'package:movie_app/domain/core/di/injectable.dart';
import 'package:movie_app/domain/movie_details/models/movie/movie.dart';
import 'package:movie_app/presentation/movie_details/genre.dart';
import 'package:movie_app/presentation/widgets/custom_error.dart';
import 'package:movie_app/presentation/widgets/heading_widget.dart';
import 'package:movie_app/presentation/widgets/loading_indicator.dart';
import 'package:movie_app/presentation/widgets/watch.dart';

// Bloc Provider
class ScreenMovieDetails extends StatelessWidget {
  final int id;
  final Movie? movie;
  const ScreenMovieDetails({super.key, required this.id, required this.movie});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MovieDetailsBloc>(),
      child: _ScreenMovieDetails(id: id, movie: movie),
    );
  }
}

// Screen Movie Details
class _ScreenMovieDetails extends StatelessWidget {
  final int id;
  final Movie? movie;
  const _ScreenMovieDetails({required this.id, required this.movie});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getMovie(context);
    });

    return Scaffold(body: SafeArea(
      child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
          builder: (context, state) {
        // Loading state
        if (state.isLoading) {
          return const LoadingIndicatorWidget();
        }

        // Error state
        if (state.isError) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomErrorWidget(),
              kHeight30,
              ElevatedButton(
                  onPressed: () => _getMovie(context),
                  child: const Text('Retry'))
            ],
          );
        }

        // Display movie
        return MediaQuery.of(context).orientation == Orientation.portrait
            // Portrait mode
            ? Padding(
                padding: kPadding10,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Watch(movie: state.movie!),
                    ..._details(state.movie!)
                  ],
                ),
              )
            // Landscape mode
            : Row(
                children: [
                  Expanded(child: Watch(movie: state.movie!)),
                  Expanded(
                    child: Padding(
                      padding: kPadding10,
                      child: ListView(children: _details(state.movie!)),
                    ),
                  )
                ],
              );
      }),
    ));
  }

  //Movie details
  List<Widget> _details(Movie movie) {
    return [
      // Movie Title
      HeadingWidget(title: movie.title),

      kHeight,

      // Language, Explicit content
      Row(
        children: [
          Text(languageMap[movie.originalLanguage] ?? movie.originalLanguage),
          if (movie.adult) const Icon(Icons.explicit_rounded, color: kRedColor),
        ],
      ),

      kHeight,

      // Generes
      GenresWidget(genreIds: movie.genreIds),

      kHeight,

      // If an original title different from title is available
      if (movie.title != movie.originalTitle)
        HeadingWidget(title: movie.originalTitle),

      // Released on
      Text(
        'Released on ${movie.releaseDate}',
        style: const TextStyle(color: kGreyColor),
      ),

      // Overview
      Text(
        movie.overview,
      ),

      kHeight,

      // Popularity
      Text('Popularity Points : ${movie.popularity}'),

      // Rating
      Text(
          'Average Rating : ${movie.voteAverage} / 10 (${movie.voteCount} Votes)'),
    ];
  }

  void _getMovie(BuildContext context) {
    BlocProvider.of<MovieDetailsBloc>(context)
        .add(MovieDetailsEvent.getMovie(id, movie));
  }
}
