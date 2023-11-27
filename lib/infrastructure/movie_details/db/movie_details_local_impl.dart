import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/movie_details/models/movie/movie.dart';
import 'package:movie_app/domain/movie_details/movie_details_service.dart';
import 'package:movie_app/infrastructure/sqflite.dart';

@LazySingleton(as: MovieDetailsLocalService)
class MovieDetailsLocalImpl implements MovieDetailsLocalService {
  @override
  Future<Movie?> getMovie(int id) async {
    final result = await DB.db.query(DB.movies, where: 'id=?', whereArgs: [id]);

    return result.isNotEmpty ? Movie.fromJson(result[0]) : null;
  }
}
