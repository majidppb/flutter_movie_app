import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/domain/core/di/injectable.dart';
import 'package:movie_app/domain/core/my_app_router/my_app_router_constatnts.dart';
import 'package:movie_app/domain/movie_details/models/movie/movie.dart';
import 'package:movie_app/infrastructure/shared_prefs.dart';
import 'package:movie_app/presentation/library/screen_library.dart';
import 'package:movie_app/presentation/fast_laugh/screen_fast_laugh.dart';
import 'package:movie_app/presentation/home/screen_home.dart';
import 'package:movie_app/presentation/login/screen_login.dart';
import 'package:movie_app/presentation/movie_details/screen_movie_details.dart';
import 'package:movie_app/presentation/navbar/screen_navbar.dart';
import 'package:movie_app/presentation/new_and_hot/screen_new_and_hot.dart';
import 'package:movie_app/presentation/search/screen_search.dart';
import 'package:movie_app/presentation/search/screen_search_results.dart';
import 'package:movie_app/presentation/settings/screen_settings.dart';
import 'package:movie_app/presentation/who_is_watching/screen_who_is_watching.dart';

class MyAppRouter {
  static final MyAppRouter _instance = MyAppRouter._internal();

  factory MyAppRouter() {
    return _instance;
  }

  static late final GoRouter router;

  // Keys
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _homeNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _hotAndNewNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _fastLaughsNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _searchNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _libraryNavigatorKey =
      GlobalKey<NavigatorState>();

  MyAppRouter._internal() {
    final routes = [
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: _rootNavigatorKey,
        branches: [
          StatefulShellBranch(
            navigatorKey: _homeNavigatorKey,
            initialLocation: MyAppRouterConstatnts.homePath,
            routes: [
              GoRoute(
                path: MyAppRouterConstatnts.homePath,
                pageBuilder: (context, GoRouterState state) {
                  return _getPage(
                    child: const ScreenHome(),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _hotAndNewNavigatorKey,
            initialLocation: MyAppRouterConstatnts.hotAndNewPath,
            routes: [
              GoRoute(
                path: MyAppRouterConstatnts.hotAndNewPath,
                pageBuilder: (context, state) {
                  return _getPage(
                    child: const ScreenNewAndHot(),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _fastLaughsNavigatorKey,
            initialLocation: MyAppRouterConstatnts.fastLaughsPath,
            routes: [
              GoRoute(
                path: MyAppRouterConstatnts.fastLaughsPath,
                pageBuilder: (context, state) {
                  return _getPage(
                    child: const ScreenFastLaugh(),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _searchNavigatorKey,
            initialLocation: MyAppRouterConstatnts.searchPath,
            routes: [
              GoRoute(
                  path: MyAppRouterConstatnts.searchPath,
                  pageBuilder: (context, state) {
                    return _getPage(
                      child: const ScreenSearch(),
                      state: state,
                    );
                  },
                  routes: [
                    GoRoute(
                      path: MyAppRouterConstatnts.searchResultsPath,
                      pageBuilder: (context, state) {
                        final searchQuery =
                            state.pathParameters['searchQuery'] as String;
                        return _getPage(
                          child: ScreenSearchResults(
                              // key: ValueKey(searchQuery),
                              searchQuery: searchQuery),
                          state: state,
                        );
                      },
                    )
                  ]),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _libraryNavigatorKey,
            initialLocation: MyAppRouterConstatnts.libraryPath,
            routes: [
              GoRoute(
                path: MyAppRouterConstatnts.libraryPath,
                pageBuilder: (context, state) {
                  return _getPage(
                    child: const ScreenLibrary(),
                    state: state,
                  );
                },
              ),
            ],
          ),
        ],
        pageBuilder: (
          BuildContext context,
          GoRouterState state,
          StatefulNavigationShell navigationShell,
        ) {
          // Set bottom navbar index
          navBarIndex.value = navigationShell.currentIndex;
          return _getPage(
            child: BottomNavigationPage(
              child: navigationShell,
            ),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: MyAppRouterConstatnts.logInPath,
        pageBuilder: (context, state) {
          return _getPage(
            child: const ScreenLogin(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: MyAppRouterConstatnts.whoIsWatchingPath,
        pageBuilder: (context, state) {
          return _getPage(
            child: const ScreenWhoIsWatching(),
            state: state,
          );
        },
      ),
      GoRoute(
        path: '${MyAppRouterConstatnts.movieDetailsPath}:id',
        pageBuilder: (context, state) {
          final id = int.parse(state.pathParameters['id'] as String);
          final Movie? movie =
              state.extra != null ? state.extra as Movie : null;

          return _getPage(
            child: ScreenMovieDetails(key: ValueKey(id), id: id, movie: movie),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: MyAppRouterConstatnts.settingsPath,
        pageBuilder: (context, state) {
          return _getPage(
            child: const ScreenSettings(),
            state: state,
          );
        },
      ),
    ];

    router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: getIt<SharedPrefs>().getLoggedIn
          ? MyAppRouterConstatnts.whoIsWatchingPath
          : MyAppRouterConstatnts.logInPath,
      routes: routes,
    );
  }

  static Page _getPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
    );
  }
}
