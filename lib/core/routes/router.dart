import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/di/injectable.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:movie_app/domain/movie_details/models/movie/movie.dart';
import 'package:movie_app/infrastructure/core/shared_prefs.dart';
import 'package:movie_app/presentation/library/screen_library.dart';
import 'package:movie_app/presentation/fast_laugh/screen_fast_laugh.dart';
import 'package:movie_app/presentation/home/screen_home.dart';
import 'package:movie_app/presentation/login/screen_login.dart';
import 'package:movie_app/presentation/movie_details/screen_movie_details.dart';
import 'package:movie_app/presentation/core/navbar/screen_navbar.dart';
import 'package:movie_app/presentation/new_and_hot/screen_new_and_hot.dart';
import 'package:movie_app/presentation/search/screen_search.dart';
import 'package:movie_app/presentation/search/screen_search_results.dart';
import 'package:movie_app/presentation/settings/screen_settings.dart';
import 'package:movie_app/presentation/who_is_watching/screen_who_is_watching.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _homeNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _hotAndNewNavigatorKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _fastLaughsNavigatorKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _searchNavigatorKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _libraryNavigatorKey =
    GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: getIt<SharedPrefs>().getLoggedIn
      ? Routes.whoIsWatchingPath
      : Routes.logInPath,
  routes: [
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: _rootNavigatorKey,
      branches: [
        StatefulShellBranch(
          navigatorKey: _homeNavigatorKey,
          initialLocation: Routes.homePath,
          routes: [
            GoRoute(
              path: Routes.homePath,
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
          initialLocation: Routes.hotAndNewPath,
          routes: [
            GoRoute(
              path: Routes.hotAndNewPath,
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
          initialLocation: Routes.fastLaughsPath,
          routes: [
            GoRoute(
              path: Routes.fastLaughsPath,
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
          initialLocation: Routes.searchPath,
          routes: [
            GoRoute(
                path: Routes.searchPath,
                pageBuilder: (context, state) {
                  return _getPage(
                    child: const ScreenSearch(),
                    state: state,
                  );
                },
                routes: [
                  GoRoute(
                    path: Routes.searchResultsPath,
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
          initialLocation: Routes.libraryPath,
          routes: [
            GoRoute(
              path: Routes.libraryPath,
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
      path: Routes.logInPath,
      pageBuilder: (context, state) {
        return _getPage(
          child: const ScreenLogin(),
          state: state,
        );
      },
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: Routes.whoIsWatchingPath,
      pageBuilder: (context, state) {
        return _getPage(
          child: const ScreenWhoIsWatching(),
          state: state,
        );
      },
    ),
    GoRoute(
      path: '${Routes.movieDetailsPath}:id',
      pageBuilder: (context, state) {
        final id = int.parse(state.pathParameters['id'] as String);
        final Movie? movie = state.extra != null ? state.extra as Movie : null;

        return _getPage(
          child: ScreenMovieDetails(key: ValueKey(id), id: id, movie: movie),
          state: state,
        );
      },
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: Routes.settingsPath,
      pageBuilder: (context, state) {
        return _getPage(
          child: const ScreenSettings(),
          state: state,
        );
      },
    ),
  ],
);

Page _getPage({
  required Widget child,
  required GoRouterState state,
}) {
  return MaterialPage(
    key: state.pageKey,
    child: child,
  );
}
