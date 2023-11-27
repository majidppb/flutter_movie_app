import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/domain/movie_details/models/movie/movie.dart';

part 'api_response.g.dart';

@JsonSerializable()
class ApiResponse {
  List<Movie> results;

  @JsonKey(name: 'total_pages')
  int totalPages;

  ApiResponse({
    required this.results,
    required this.totalPages,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return _$ApiResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);
}
