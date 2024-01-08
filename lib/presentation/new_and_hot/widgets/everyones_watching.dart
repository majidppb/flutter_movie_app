import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/application/new_and_hot/new_and_hot_bloc.dart';
import 'package:movie_app/presentation/core/colors.dart';
import 'package:movie_app/presentation/core/styles.dart';
import 'package:movie_app/domain/movie_details/models/movie/movie.dart';
import 'package:movie_app/presentation/core/widgets/heading_widget.dart';
import 'package:movie_app/presentation/core/widgets/watch.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewAndHotBloc, NewAndHotState>(
      builder: (context, state) {
        return ListView.separated(
          padding: const EdgeInsetsDirectional.symmetric(vertical: 35),
          itemBuilder: ((context, index) {
            final movie = state.everyonesWatching[index];
            return _EveryonesWatchingItem(movie: movie);
          }),
          separatorBuilder: ((context, index) => kHeight55),
          itemCount: state.everyonesWatching.length,
          shrinkWrap: true,
        );
      },
    );
  }
}

// Sub Widget
class _EveryonesWatchingItem extends StatelessWidget {
  final Movie _movie;

  const _EveryonesWatchingItem({required Movie movie}) : _movie = movie;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait
        // Portrait mode
        ? Padding(
            padding: kPadding10,
            child: Column(
              children: [Watch(movie: _movie), ..._details()],
            ),
          )
        // Landscape mode
        : LimitedBox(
            maxHeight: 350,
            maxWidth: double.infinity,
            child: Row(
              children: [
                Flexible(child: Watch(movie: _movie)),
                Flexible(
                  child: Padding(
                    padding: kPadding10,
                    child: Column(children: _details()),
                  ),
                ),
              ],
            ),
          );
  }

  List<Widget> _details() {
    return [
      if (_movie.title != _movie.originalTitle)
        HeadingWidget(title: _movie.originalTitle),
      HeadingWidget(title: _movie.title),
      Text(
        _movie.overview,
        style: const TextStyle(color: kGreyColor),
      ),
    ];
  }
}
