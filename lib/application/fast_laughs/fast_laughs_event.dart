part of 'fast_laughs_bloc.dart';

@freezed
class FastLaughsEvent with _$FastLaughsEvent {
  const factory FastLaughsEvent.getVideos({required int page}) = _GetVideos;
}
