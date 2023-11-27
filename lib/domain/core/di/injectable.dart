import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/library/my_list/my_list_service.dart';
import 'package:movie_app/infrastructure/library/my_list/my_list_repo.dart';

import 'injectable.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureInjection() {
  getIt.init();
  // Register
  getIt.registerSingleton<MyListRepository>(getIt<MyListRepo>());
}
