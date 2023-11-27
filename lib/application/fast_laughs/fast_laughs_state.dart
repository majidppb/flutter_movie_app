part of 'fast_laughs_bloc.dart';

@freezed
class FastLaughsState with _$FastLaughsState {
  const factory FastLaughsState({
    bool? isError,
    List<FastLaughsVideo>? videos,
    int? nextPage,
  }) = _FastLaughs;
  factory FastLaughsState.initial() => const FastLaughsState();
}
