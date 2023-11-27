part of 'settings_bloc.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.getSettings() = _GetSettings;
  const factory SettingsEvent.saveSettings({required bool isExplicitAllowed}) =
      _SaveSettings;
  const factory SettingsEvent.logOut() = _LogOut;
}
