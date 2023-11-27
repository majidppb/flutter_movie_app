part of 'new_and_hot_bloc.dart';

@freezed
class NewAndHotEvent with _$NewAndHotEvent {
  const factory NewAndHotEvent.getComingSoon() = _GetComingSoon;
  const factory NewAndHotEvent.getEveryonesWatching() = _GetEveryonesWatching;
}
