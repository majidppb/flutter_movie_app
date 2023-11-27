import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/domain/core/functions/custom_serialization.dart';

part 'movie.g.dart';

@JsonSerializable(includeIfNull: false)
class Movie {
  @JsonKey(toJson: boolToJson, fromJson: boolFromJson)
  bool adult;

  @JsonKey(name: 'backdrop_path')
  String? backdropPath;

  @JsonKey(name: 'genre_ids', toJson: intListToJson, fromJson: intListFromJson)
  List<int> genreIds;

  int id;

  @JsonKey(name: 'original_language')
  String originalLanguage;

  @JsonKey(name: 'original_title')
  String originalTitle;

  String overview;

  double popularity;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  @JsonKey(name: 'release_date')
  String releaseDate;

  String title;

  @JsonKey(name: 'vote_average')
  double voteAverage;

  @JsonKey(name: 'vote_count')
  int voteCount;

  Movie({
    required this.adult,
    this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return _$MovieFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
