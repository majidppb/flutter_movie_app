import '../../movie_details/models/movie/movie.dart';

///  Add, delete and check whether an is present in My List
abstract class MyListRepository {
  Future<bool> isInMyList(int id);
  Future<void> insertItem(Movie movie);
  Future<void> deleteItem(int id);
}
