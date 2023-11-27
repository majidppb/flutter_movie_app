import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/core/di/injectable.dart';
import 'package:movie_app/domain/who_is_watching/models/profile/profile.dart';
import 'package:movie_app/domain/who_is_watching/profile_service.dart';
import 'package:movie_app/infrastructure/shared_prefs.dart';
import 'package:movie_app/infrastructure/sqflite.dart';

@LazySingleton(as: ProfileService)
class ProfileImpl implements ProfileService {
  @override
  Future<List<Profile>> getProfiles() async {
    final List<Map<String, dynamic>> profiles = await DB.db.query(DB.profiles);
    return profiles.map((profile) => Profile.fromJson(profile)).toList();
  }

  @override
  Future<void> insertProfile(Profile profile) async {
    await DB.db.insert(DB.profiles, profile.toJson());
  }

  @override
  Future<void> updateProfile(Profile profile) async {
    final prefs = getIt<SharedPrefs>();
    await DB.db.update(DB.profiles, profile.toJson(),
        where: 'id = ?', whereArgs: [prefs.getCurrentProfile]);
  }

  @override
  Future<void> clear() async {
    await DB.db.delete(DB.profiles);
  }
}
