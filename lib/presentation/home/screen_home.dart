import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/application/home/home_bloc.dart';
import 'package:movie_app/presentation/home/widgets/home_screen_appbar.dart';
import 'package:movie_app/presentation/home/widgets/horizontal_movie_list.dart';
import 'package:movie_app/presentation/home/widgets/main_movie_poster.dart';
import 'package:movie_app/presentation/home/widgets/top_rated_movie_list.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const HomeEvent.getTopRated());
      BlocProvider.of<HomeBloc>(context)
          .add(const HomeEvent.getReleasedInPastYear());
    });

    return const Scaffold(
      body: SafeArea(
        // Reference : https://docs.flutter.dev/cookbook/lists/floating-app-bar
        child: CustomScrollView(
          slivers: [
            HomeScreenAppBarWidget(),
            SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  MainMoviePoster(),
                  TopTenMovieListWidget(),
                  TopRatedMovieListWidget(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
