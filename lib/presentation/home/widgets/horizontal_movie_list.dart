import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/application/home/home_bloc.dart';
import 'package:movie_app/core/constants.dart';
import 'package:movie_app/presentation/widgets/custom_error.dart';
import 'package:movie_app/presentation/widgets/heading_widget.dart';
import 'package:movie_app/presentation/widgets/loading_indicator.dart';
import 'package:movie_app/presentation/widgets/vertical_movie_tile.dart';

class TopRatedMovieListWidget extends StatelessWidget {
  const TopRatedMovieListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10, bottom: 10),
            child: HeadingWidget(title: 'Released in the Past Year'),
          ),
          SizedBox(
            // Vertical Movie Tile height
            height: MediaQuery.of(context).size.shortestSide * 0.47,
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state.isReleasedInPastYearLoading) {
                  return const LoadingIndicatorWidget();
                }
                if (state.isReleasedInPastYearError) {
                  return const CustomErrorWidget();
                }
                return ListView.separated(
                  padding: kMovieListPadding,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    final movie = state.releasedInPastYear[index];
                    return VerticalMovieTile(movie: movie);
                  },
                  separatorBuilder: (_, __) => kWidth,
                  itemCount: state.releasedInPastYear.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
