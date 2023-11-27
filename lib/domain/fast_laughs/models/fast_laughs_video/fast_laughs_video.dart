import 'package:json_annotation/json_annotation.dart';

part 'fast_laughs_video.g.dart';

@JsonSerializable()
class FastLaughsVideo {
  String? thumbnailUrl;
  String? videoUrl;

  FastLaughsVideo({this.thumbnailUrl, this.videoUrl});

  factory FastLaughsVideo.fromJson(Map<String, dynamic> json) {
    return _$FastLaughsVideoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FastLaughsVideoToJson(this);
}
