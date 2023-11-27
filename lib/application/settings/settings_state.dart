part of 'settings_bloc.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    required String name,
    required bool isExplicitAllowed,
  }) = _SettingsState;
  factory SettingsState.initial() =>
      const SettingsState(name: '', isExplicitAllowed: false);
}
