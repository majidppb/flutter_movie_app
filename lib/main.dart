import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/application/fast_laughs/fast_laughs_bloc.dart';
import 'package:movie_app/application/home/home_bloc.dart';
import 'package:movie_app/application/library/library_bloc.dart';
import 'package:movie_app/application/new_and_hot/new_and_hot_bloc.dart';
import 'package:movie_app/application/search/search_bloc.dart';
import 'package:movie_app/application/settings/settings_bloc.dart';
import 'package:movie_app/core/colors.dart';
import 'package:movie_app/core/theme.dart';
import 'package:movie_app/domain/core/di/injectable.dart';
import 'package:movie_app/infrastructure/sqflite.dart';
import 'package:movie_app/domain/library/my_list/my_list_service.dart';
import 'package:movie_app/domain/core/my_app_router/my_app_router.dart';

// movieapp.com/
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection();
  await DB.init();
  MyAppRouter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Precache the images for faster loading
    _preCacheImages(context);

    return RepositoryProvider(
      // For add, delete and check items in My List
      create: (context) => getIt<MyListRepository>(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (ctx) => getIt<HomeBloc>(),
          ),
          BlocProvider(
            create: (ctx) => getIt<NewAndHotBloc>(),
          ),
          BlocProvider(
            create: (ctx) => getIt<FastLaughsBloc>(),
          ),
          BlocProvider(
            create: (context) => getIt<SearchBloc>(),
          ),
          BlocProvider(
            create: (context) => getIt<LibraryBloc>(),
          ),
          BlocProvider(
            create: (ctx) => getIt<SettingsBloc>(),
          ),
        ],
        child: MaterialApp.router(
          title: 'Movie App',
          restorationScopeId: 'root',
          debugShowCheckedModeBanner: false,
          routerConfig: MyAppRouter.router,
          themeMode: ThemeMode.dark,
          darkTheme: ThemeData(
            appBarTheme: appBarTheme,
            inputDecorationTheme: inputDecorationTheme,
            textTheme: textTheme,
            scaffoldBackgroundColor: kBackgroundColor,
            fontFamily: GoogleFonts.montserrat().fontFamily,
          ),
        ),
      ),
    );
  }

  Future<void> _preCacheImages(BuildContext context) async {
    precacheImage(const AssetImage('assets/banner.png'), context);
    precacheImage(const AssetImage('assets/logo.png'), context);
    precacheImage(const AssetImage('assets/profile.png'), context);
  }
}
