import 'package:movie_app/core/notifier/notifier.dart';
import 'package:movie_app/domain/movie_details/models/movie/movie.dart';

abstract class MyListService {
  /// A change notifier to notify the listners that some update happened
  final changeNotifier = Notifier();

  Future<bool> isInMyList(int id);
  Future<void> insertItem(Movie movie);
  Future<void> deleteItem(int id);
  Future<List<Map<String, dynamic>>> getMyList();
  Future<void> clear();
}
