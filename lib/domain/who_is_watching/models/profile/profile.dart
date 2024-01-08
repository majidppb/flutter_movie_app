import 'package:json_annotation/json_annotation.dart';

import '../../../../infrastructure/core/custom_serialization/bool.dart';

part 'profile.g.dart';

@JsonSerializable(includeIfNull: false)
class Profile {
  final int? id;

  final String name;

  @JsonKey(
      name: 'is_explicit_allowed', toJson: boolToJson, fromJson: boolFromJson)
  final bool isExplicitAllowed;

  Profile({this.id, required this.name, required this.isExplicitAllowed});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return _$ProfileFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
