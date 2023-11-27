// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      adult: boolFromJson(json['adult']),
      backdropPath: json['backdrop_path'] as String?,
      genreIds: intListFromJson(json['genre_ids']),
      id: json['id'] as int,
      originalLanguage: json['original_language'] as String,
      originalTitle: json['original_title'] as String,
      overview: json['overview'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      posterPath: json['poster_path'] as String?,
      releaseDate: json['release_date'] as String,
      title: json['title'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'] as int,
    );

Map<String, dynamic> _$MovieToJson(Movie instance) {
  final val = <String, dynamic>{
    'adult': boolToJson(instance.adult),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('backdrop_path', instance.backdropPath);
  val['genre_ids'] = intListToJson(instance.genreIds);
  val['id'] = instance.id;
  val['original_language'] = instance.originalLanguage;
  val['original_title'] = instance.originalTitle;
  val['overview'] = instance.overview;
  val['popularity'] = instance.popularity;
  writeNotNull('poster_path', instance.posterPath);
  val['release_date'] = instance.releaseDate;
  val['title'] = instance.title;
  val['vote_average'] = instance.voteAverage;
  val['vote_count'] = instance.voteCount;
  return val;
}
