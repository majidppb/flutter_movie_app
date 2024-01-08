import 'package:flutter/material.dart';
import 'package:movie_app/presentation/core/styles.dart';
import 'package:movie_app/presentation/core/genre_map.dart';

class GenresWidget extends StatelessWidget {
  final List<int> _genreIds;
  const GenresWidget({super.key, required List<int> genreIds})
      : _genreIds = genreIds;

  @override
  Widget build(BuildContext context) {
    final List<_GenreItem> genres =
        _genreIds.map((id) => _GenreItem(text: genreMap[id] ?? '')).toList();
    return Wrap(
      spacing: 10, // Horizontal spacing between items
      runSpacing: 10, // Vertical spacing between rows
      alignment: WrapAlignment.center,
      children: genres,
    );
  }
}

class _GenreItem extends StatelessWidget {
  final String _text;

  const _GenreItem({required text}) : _text = text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kPadding10,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(_text),
    );
  }
}
