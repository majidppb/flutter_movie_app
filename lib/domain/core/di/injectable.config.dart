// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:movie_app/application/edit_profile/edit_profile_bloc.dart'
    as _i22;
import 'package:movie_app/application/fast_laughs/fast_laughs_bloc.dart'
    as _i23;
import 'package:movie_app/application/home/home_bloc.dart' as _i24;
import 'package:movie_app/application/library/library_bloc.dart' as _i25;
import 'package:movie_app/application/login/login_bloc.dart' as _i26;
import 'package:movie_app/application/movie_details/movie_details_bloc.dart'
    as _i27;
import 'package:movie_app/application/new_and_hot/new_and_hot_bloc.dart'
    as _i29;
import 'package:movie_app/application/search/search_bloc.dart' as _i30;
import 'package:movie_app/application/settings/settings_bloc.dart' as _i31;
import 'package:movie_app/application/who_is_watching/who_is_watching_bloc.dart'
    as _i21;
import 'package:movie_app/domain/fast_laughs/get_videos_service.dart' as _i5;
import 'package:movie_app/domain/home/home_service.dart' as _i7;
import 'package:movie_app/domain/library/downloads/downloads_service.dart'
    as _i3;
import 'package:movie_app/domain/library/my_list/my_list_service.dart' as _i12;
import 'package:movie_app/domain/movie_details/movie_details_service.dart'
    as _i9;
import 'package:movie_app/domain/new_and_hot/new_and_hot_service.dart' as _i14;
import 'package:movie_app/domain/search/search_service.dart' as _i18;
import 'package:movie_app/domain/who_is_watching/profile_service.dart' as _i16;
import 'package:movie_app/infrastructure/fast_laughs/get_videos_impl.dart'
    as _i6;
import 'package:movie_app/infrastructure/home/home_impl.dart' as _i8;
import 'package:movie_app/infrastructure/library/downloads/downloads_impl.dart'
    as _i4;
import 'package:movie_app/infrastructure/library/my_list/db/my_list_impl.dart'
    as _i13;
import 'package:movie_app/infrastructure/library/my_list/my_list_repo.dart'
    as _i28;
import 'package:movie_app/infrastructure/movie_details/db/movie_details_local_impl.dart'
    as _i10;
import 'package:movie_app/infrastructure/movie_details/movie_deatils_remote_impl.dart'
    as _i11;
import 'package:movie_app/infrastructure/new_and_hot/new_and_hot_impl.dart'
    as _i15;
import 'package:movie_app/infrastructure/search/search_impl.dart' as _i19;
import 'package:movie_app/infrastructure/shared_prefs.dart' as _i20;
import 'package:movie_app/infrastructure/who_is_watching/profile/db/profile_impl.dart'
    as _i17;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.DownloadsService>(() => _i4.DownloadsImpl());
    gh.lazySingleton<_i5.FastLaughsVideosService>(
        () => _i6.FastLaughsVideosImpl());
    gh.lazySingleton<_i7.HomeService>(() => _i8.HomeImpl());
    gh.lazySingleton<_i9.MovieDetailsLocalService>(
        () => _i10.MovieDetailsLocalImpl());
    gh.lazySingleton<_i9.MovieDetailsRemoteService>(
        () => _i11.MovieDetailsRemoteImpl());
    gh.lazySingleton<_i12.MyListService>(() => _i13.MyListDB());
    gh.lazySingleton<_i14.NewAndHotService>(() => _i15.NewAndHotImpl());
    gh.lazySingleton<_i16.ProfileService>(() => _i17.ProfileImpl());
    gh.lazySingleton<_i18.SearchService>(() => _i19.SearchImpl());
    gh.singleton<_i20.SharedPrefs>(_i20.SharedPrefs());
    gh.factory<_i21.WhoIsWatchingBloc>(
        () => _i21.WhoIsWatchingBloc(gh<_i16.ProfileService>()));
    gh.factory<_i22.EditProfileBloc>(() => _i22.EditProfileBloc(
          gh<_i16.ProfileService>(),
          gh<_i20.SharedPrefs>(),
        ));
    gh.factory<_i23.FastLaughsBloc>(
        () => _i23.FastLaughsBloc(gh<_i5.FastLaughsVideosService>()));
    gh.factory<_i24.HomeBloc>(() => _i24.HomeBloc(gh<_i7.HomeService>()));
    gh.factory<_i25.LibraryBloc>(() => _i25.LibraryBloc(
          gh<_i3.DownloadsService>(),
          gh<_i12.MyListService>(),
        ));
    gh.factory<_i26.LoginBloc>(() => _i26.LoginBloc(gh<_i20.SharedPrefs>()));
    gh.factory<_i27.MovieDetailsBloc>(() => _i27.MovieDetailsBloc(
          gh<_i9.MovieDetailsLocalService>(),
          gh<_i9.MovieDetailsRemoteService>(),
        ));
    gh.factory<_i28.MyListRepo>(
        () => _i28.MyListRepo(gh<_i12.MyListService>()));
    gh.factory<_i29.NewAndHotBloc>(
        () => _i29.NewAndHotBloc(gh<_i14.NewAndHotService>()));
    gh.factory<_i30.SearchBloc>(
        () => _i30.SearchBloc(gh<_i18.SearchService>()));
    gh.factory<_i31.SettingsBloc>(() => _i31.SettingsBloc(
          gh<_i12.MyListService>(),
          gh<_i16.ProfileService>(),
          gh<_i20.SharedPrefs>(),
        ));
    return this;
  }
}
