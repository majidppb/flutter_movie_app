part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.getTopRated() = _GetTopRated;
  const factory HomeEvent.getReleasedInPastYear() = _GetReleasedInPastYear;
}
