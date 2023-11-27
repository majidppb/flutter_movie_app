import 'package:movie_app/core/notifier/notifier.dart';
import 'package:movie_app/domain/movie_details/models/movie/movie.dart';

abstract class MyListRepository {
  Future<bool> isInMyList(int id);
  Future<void> insertItem(Movie movie);
  Future<void> deleteItem(int id);
}

abstract class MyListService extends MyListRepository {
  // A change notifier to notify the listners that some update happened
  final changeNotifier = Notifier();

  // Abstract Methods to Implement
  Future<List<Map<String, dynamic>>> getMyList();
  Future<void> clear();
}
