import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:movie_app/application/search/search_bloc.dart';
import 'package:movie_app/core/colors.dart';
import 'package:movie_app/core/constants.dart';
import 'package:movie_app/domain/core/functions/image_path.dart';
import 'package:movie_app/domain/core/my_app_router/my_app_router.dart';
import 'package:movie_app/domain/core/my_app_router/my_app_router_constatnts.dart';
import 'package:movie_app/domain/movie_details/models/movie/movie.dart';
import 'package:movie_app/presentation/widgets/custom_error.dart';
import 'package:movie_app/presentation/widgets/heading_widget.dart';
import 'package:movie_app/presentation/widgets/loading_indicator.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const SearchEvent.initialize());
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kPadding10,
          child: Column(
            children: [
              // Search Box
              CupertinoSearchTextField(
                backgroundColor: Colors.grey.withOpacity(0.4),
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const Icon(CupertinoIcons.xmark_circle_fill,
                    color: Colors.grey),
                style: const TextStyle(color: Colors.white),
                onSubmitted: (searchQuery) {
                  if (searchQuery.isNotEmpty) {
                    // Goto results screen
                    MyAppRouter.router.push(
                        '${MyAppRouterConstatnts.searchPath}/$searchQuery');
                  }
                },
              ),
              kHeight,
              // Main content
              Expanded(
                child: BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    if (state.isIdleLoading) {
                      return const LoadingIndicatorWidget();
                    }
                    if (state.isIdleError) {
                      return const CustomErrorWidget();
                    }
                    if (state.idleList.isEmpty) {
                      return const Center(
                        child: Text('Empty'),
                      );
                    }
                    // Trending Search
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const HeadingWidget(title: 'Top Searches'),
                        kHeight,
                        Expanded(
                          child: ListView.separated(
                              //shrinkWrap: true,
                              itemBuilder: (ctx, index) {
                                final movie = state.idleList[index];
                                return _TopSearchItemTile(movie: movie);
                              },
                              separatorBuilder: (ctx, index) => kHeight20,
                              itemCount: state.idleList.length),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopSearchItemTile extends StatelessWidget {
  final Movie _movie;

  const _TopSearchItemTile({
    required Movie movie,
  }) : _movie = movie;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      // Goto Movie Details Screen
      onTap: () {
        MyAppRouter.router.push(
            '${MyAppRouterConstatnts.movieDetailsPath}${_movie.id}',
            extra: _movie);
      },
      child: Row(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: imagePath(_movie.backdropPath!),
              height: 80,
              width: screenWidth * 0.35,
              placeholder: (_, __) => const LoadingTextWidget(),
              errorWidget: (_, __, ___) =>
                  const Center(child: Icon(Icons.error_outline_rounded)),
              cacheManager: CacheManager(
                Config(
                  'trending',
                  stalePeriod: const Duration(days: 1),
                ),
              ),
            ),
          ),

          // Title
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _movie.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          )),

          // Play Icon
          const Icon(
            Icons.play_circle_outline,
            color: kWhiteColor,
            size: 35,
          ),
        ],
      ),
    );
  }
}
