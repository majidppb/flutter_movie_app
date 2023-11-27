import 'package:movie_app/domain/who_is_watching/models/profile/profile.dart';

abstract class ProfileService {
  Future<List<Profile>> getProfiles();
  Future<void> insertProfile(Profile profile);
  Future<void> updateProfile(Profile profile);
  Future<void> clear();
}
