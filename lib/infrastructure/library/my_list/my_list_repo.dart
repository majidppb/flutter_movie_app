import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/library/my_list/my_list_reposiory.dart';
import 'package:movie_app/domain/movie_details/models/movie/movie.dart';

import '../../../domain/library/my_list/my_list_service.dart';

@injectable
class MyListRepo implements MyListRepository {
  final MyListService _myListService;

  MyListRepo(this._myListService);

  @override
  Future<void> deleteItem(int id) async {
    await _myListService.deleteItem(id);
  }

  @override
  Future<void> insertItem(Movie movie) async {
    await _myListService.insertItem(movie);
  }

  @override
  Future<bool> isInMyList(int id) async {
    return await _myListService.isInMyList(id);
  }
}
