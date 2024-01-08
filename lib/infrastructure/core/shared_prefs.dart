import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton()
class SharedPrefs {
  // SharedPreferences instance
  late SharedPreferences _prefs;

  SharedPrefs() {
    initialize();
  }

  // Initializes SharedPreferences instance
  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Logged in
  static const _loggedIn = 'logged_in';

  bool get getLoggedIn {
    return _prefs.getBool(_loggedIn) ?? false;
  }

  setLoggedIn(bool user) async {
    await _prefs.setBool(_loggedIn, user);
  }

  // Name
  static const _name = 'name';

  String get getName {
    return _prefs.getString(_name)!;
  }

  setName(String user) async {
    await _prefs.setString(_name, user);
  }

  // Current Profile
  static const _currentProfile = 'current_profile';

  int get getCurrentProfile {
    return _prefs.getInt(_currentProfile)!;
  }

  setCurrentProfile(int user) async {
    await _prefs.setInt(_currentProfile, user);
  }

  // Is Explicit Allowed
  static const _isExplicitAllowed = 'is_explict_allowed';

  bool get getIsExplicitAllowed {
    return _prefs.getBool(_isExplicitAllowed)!;
  }

  setIsExplicitAllowed(bool user) async {
    await _prefs.setBool(_isExplicitAllowed, user);
  }

  // Clear All Values
  clear() async {
    await _prefs.clear();
  }
}
