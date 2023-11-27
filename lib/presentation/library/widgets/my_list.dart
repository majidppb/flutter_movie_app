import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/application/library/library_bloc.dart';
import 'package:movie_app/core/colors.dart';
import 'package:movie_app/core/constants.dart';
import 'package:movie_app/core/language_map.dart';
import 'package:movie_app/domain/core/my_app_router/my_app_router.dart';
import 'package:movie_app/domain/core/my_app_router/my_app_router_constatnts.dart';
import 'package:movie_app/domain/movie_details/models/movie/movie.dart';
import 'package:movie_app/presentation/library/widgets/movie_poster.dart';

class MyListWidget extends StatelessWidget {
  const MyListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LibraryBloc, LibraryState>(
      builder: (context, state) {
        return ListView.separated(
          itemBuilder: (ctx, index) {
            final Movie movie = state.myList[index]['movie'];
            final DateTime created = state.myList[index]['created'];

            return ListTile(
              visualDensity: const VisualDensity(vertical: 4),

              // Poster
              leading: VerticalMoviePoster(
                title: movie.title,
                posterPath: movie.posterPath,
              ),

              // Movie Title
              title: Text(
                movie.title,
                style: const TextStyle(color: kWhiteColor),
              ),

              // DateTime: when it is added to MyList
              subtitle: Text(
                DateFormat.yMMMd().add_jm().format(created),
                style: const TextStyle(color: kLightGreyColor),
              ),

              // Language
              trailing: Text(languageMap[movie.originalLanguage] ??
                  movie.originalLanguage),

              // Show Movie Details on tap
              onTap: () {
                MyAppRouter.router.push(
                    '${MyAppRouterConstatnts.movieDetailsPath}${movie.id}',
                    extra: movie);
              },
            );
          },
          separatorBuilder: (ctx, index) => kHeight,
          itemCount: state.myList.length,
          shrinkWrap: true,
        );
      },
    );
  }
}
