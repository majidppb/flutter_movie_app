import 'package:injectable/injectable.dart';
import 'package:movie_app/core/di/injectable.dart';
import 'package:movie_app/domain/movie_details/models/movie/movie.dart';
import 'package:movie_app/infrastructure/core/shared_prefs.dart';
import 'package:movie_app/infrastructure/core/sqflite.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../domain/library/my_list/my_list_service.dart';

@LazySingleton(as: MyListService)
class MyListDB extends MyListService {
  @override
  Future<List<Map<String, dynamic>>> getMyList() async {
    final profile = getIt<SharedPrefs>().getCurrentProfile;
    final result = await DB.db.rawQuery(
        'SELECT M.*, L.created FROM ${DB.myList} L, ${DB.movies} M WHERE profile=? AND M.id=L.movie ORDER BY created DESC',
        [profile]);

    final myList = result.map((json) {
      return {
        'movie': Movie.fromJson(json),
        'created': DateTime.parse(json['created'] as String)
      };
    }).toList();

    return myList;
  }

  @override
  Future<void> insertItem(Movie movie) async {
    final profile = getIt<SharedPrefs>().getCurrentProfile;

    // If the movie is not already in movie table, add
    await DB.db.insert(DB.movies, movie.toJson(),
        conflictAlgorithm: ConflictAlgorithm.ignore);

    await DB.db.insert(DB.myList, {'profile': profile, 'movie': movie.id});

    // Notify the change
    super.changeNotifier.notify();
  }

  @override
  Future<void> deleteItem(int id) async {
    final profile = getIt<SharedPrefs>().getCurrentProfile;

    // Delete from current profile's list
    DB.db.delete(DB.myList,
        where: 'profile=? AND movie=?', whereArgs: [profile, id]);

    // If the movie does not exists in list table, we can safely delete it from movie table
    final result = await DB.db.rawQuery(
        'SELECT NOT EXISTS(SELECT 1 FROM ${DB.myList} WHERE movie=?)', [id]);

    final canDelete = result[0].entries.first.value == 1;

    if (canDelete) {
      DB.db.delete(DB.movies, where: 'id=?', whereArgs: [id]);
    }

    // Notify the change
    super.changeNotifier.notify();
  }

  @override
  Future<bool> isInMyList(int id) async {
    final profile = getIt<SharedPrefs>().getCurrentProfile;

    final result = await DB.db.rawQuery(
        'SELECT EXISTS(SELECT 1 FROM ${DB.myList} WHERE profile=? AND movie=? )',
        [profile, id]);

    final isExist = result[0].entries.first.value == 1;

    return isExist;
  }

  @override
  Future<void> clear() async {
    DB.db.delete(DB.myList);
    DB.db.delete(DB.movies);

    // Notify the change
    super.changeNotifier.notify();
  }
}
