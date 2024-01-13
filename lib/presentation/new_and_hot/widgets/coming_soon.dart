import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/application/new_and_hot/new_and_hot_bloc.dart';
import 'package:movie_app/presentation/core/colors.dart';
import 'package:movie_app/presentation/core/styles.dart';
import 'package:movie_app/domain/movie_details/models/movie/movie.dart';
import 'package:movie_app/presentation/core/widgets/video.dart';
import 'package:movie_app/presentation/core/widgets/heading_widget.dart';
import 'package:movie_app/presentation/core/widgets/video_action.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return BlocBuilder<NewAndHotBloc, NewAndHotState>(
      builder: (context, state) {
        return isPortrait
            // Portrait mode
            ? ListView.separated(
                padding: const EdgeInsetsDirectional.symmetric(vertical: 35),
                itemBuilder: ((_, index) {
                  final movie = state.comingSoon[index];
                  return _ComingSoonItem(movie: movie);
                }),
                separatorBuilder: ((_, __) => kHeight55),
                itemCount: state.comingSoon.length,
              )
            // Landscape mode
            : GridView.count(
                scrollDirection: Axis.vertical,
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                childAspectRatio: 1 / 1.35,
                children: List.generate(state.comingSoon.length, (index) {
                  final movie = state.comingSoon[index];
                  return _ComingSoonItem(movie: movie);
                }),
              );
      },
    );
  }
}

class _ComingSoonItem extends StatelessWidget {
  final Movie _movie;

  const _ComingSoonItem({required movie}) : _movie = movie;
  @override
  Widget build(BuildContext context) {
    final date = _Date(_movie.releaseDate);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Text(
              date.year.toString(),
              style: const TextStyle(color: kGreyColor, fontSize: 17),
            ),
            Text(
              date.month,
              style: const TextStyle(fontSize: 17),
            ),
            Text(
              date.day.toString(),
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 22, letterSpacing: 5),
            ),
          ],
        ),
        kWidth,
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Show Backdrop Image or Poster Image if avilable
              VideoWidget(
                  backdrop: _movie.backdropPath, poster: _movie.posterPath),
              // Video Action Buttons
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  VideoActionGreyWidget(
                      icon: Icons.notifications_none_rounded,
                      title: 'Remind Me'),
                  VideoActionGreyWidget(
                      icon: Icons.info_outline_rounded, title: 'Info')
                ],
              ),
              // If a different original title is available
              if (_movie.title != _movie.originalTitle)
                HeadingWidget(title: _movie.originalTitle),
              // Title
              HeadingWidget(title: _movie.title),
              // Overview
              Text(_movie.overview),
            ],
          ),
        )
      ],
    );
  }
}

class _Date {
  late final int day;
  late String month;
  late final int year;

  _Date(String date) {
    final d = DateTime.parse(date);
    day = d.day;
    month = DateFormat('MMM').format(DateTime(0, d.month));
    year = d.year;
  }
}
