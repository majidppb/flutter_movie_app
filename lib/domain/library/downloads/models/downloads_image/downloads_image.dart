import 'package:json_annotation/json_annotation.dart';

part 'downloads_image.g.dart';

@JsonSerializable()
class DownloadsImage {
  @JsonKey(name: 'poster_path')
  String posterPath;

  String title;

  DownloadsImage({required this.posterPath, required this.title});

  factory DownloadsImage.fromJson(Map<String, dynamic> json) {
    return _$DownloadsImageFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DownloadsImageToJson(this);
}
