// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MovieDetailsEvent {
  int get id => throw _privateConstructorUsedError;
  Movie? get movie => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, Movie? movie) getMovie,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, Movie? movie)? getMovie,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, Movie? movie)? getMovie,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetMovie value) getMovie,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetMovie value)? getMovie,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetMovie value)? getMovie,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MovieDetailsEventCopyWith<MovieDetailsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieDetailsEventCopyWith<$Res> {
  factory $MovieDetailsEventCopyWith(
          MovieDetailsEvent value, $Res Function(MovieDetailsEvent) then) =
      _$MovieDetailsEventCopyWithImpl<$Res, MovieDetailsEvent>;
  @useResult
  $Res call({int id, Movie? movie});
}

/// @nodoc
class _$MovieDetailsEventCopyWithImpl<$Res, $Val extends MovieDetailsEvent>
    implements $MovieDetailsEventCopyWith<$Res> {
  _$MovieDetailsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? movie = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      movie: freezed == movie
          ? _value.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as Movie?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetMovieImplCopyWith<$Res>
    implements $MovieDetailsEventCopyWith<$Res> {
  factory _$$GetMovieImplCopyWith(
          _$GetMovieImpl value, $Res Function(_$GetMovieImpl) then) =
      __$$GetMovieImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, Movie? movie});
}

/// @nodoc
class __$$GetMovieImplCopyWithImpl<$Res>
    extends _$MovieDetailsEventCopyWithImpl<$Res, _$GetMovieImpl>
    implements _$$GetMovieImplCopyWith<$Res> {
  __$$GetMovieImplCopyWithImpl(
      _$GetMovieImpl _value, $Res Function(_$GetMovieImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? movie = freezed,
  }) {
    return _then(_$GetMovieImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      freezed == movie
          ? _value.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as Movie?,
    ));
  }
}

/// @nodoc

class _$GetMovieImpl implements _GetMovie {
  const _$GetMovieImpl(this.id, this.movie);

  @override
  final int id;
  @override
  final Movie? movie;

  @override
  String toString() {
    return 'MovieDetailsEvent.getMovie(id: $id, movie: $movie)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetMovieImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.movie, movie) || other.movie == movie));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, movie);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetMovieImplCopyWith<_$GetMovieImpl> get copyWith =>
      __$$GetMovieImplCopyWithImpl<_$GetMovieImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, Movie? movie) getMovie,
  }) {
    return getMovie(id, movie);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, Movie? movie)? getMovie,
  }) {
    return getMovie?.call(id, movie);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, Movie? movie)? getMovie,
    required TResult orElse(),
  }) {
    if (getMovie != null) {
      return getMovie(id, movie);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetMovie value) getMovie,
  }) {
    return getMovie(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetMovie value)? getMovie,
  }) {
    return getMovie?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetMovie value)? getMovie,
    required TResult orElse(),
  }) {
    if (getMovie != null) {
      return getMovie(this);
    }
    return orElse();
  }
}

abstract class _GetMovie implements MovieDetailsEvent {
  const factory _GetMovie(final int id, final Movie? movie) = _$GetMovieImpl;

  @override
  int get id;
  @override
  Movie? get movie;
  @override
  @JsonKey(ignore: true)
  _$$GetMovieImplCopyWith<_$GetMovieImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MovieDetailsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  Movie? get movie => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MovieDetailsStateCopyWith<MovieDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieDetailsStateCopyWith<$Res> {
  factory $MovieDetailsStateCopyWith(
          MovieDetailsState value, $Res Function(MovieDetailsState) then) =
      _$MovieDetailsStateCopyWithImpl<$Res, MovieDetailsState>;
  @useResult
  $Res call({bool isLoading, bool isError, Movie? movie});
}

/// @nodoc
class _$MovieDetailsStateCopyWithImpl<$Res, $Val extends MovieDetailsState>
    implements $MovieDetailsStateCopyWith<$Res> {
  _$MovieDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? movie = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      movie: freezed == movie
          ? _value.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as Movie?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MovieDetatilsStateImplCopyWith<$Res>
    implements $MovieDetailsStateCopyWith<$Res> {
  factory _$$MovieDetatilsStateImplCopyWith(_$MovieDetatilsStateImpl value,
          $Res Function(_$MovieDetatilsStateImpl) then) =
      __$$MovieDetatilsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool isError, Movie? movie});
}

/// @nodoc
class __$$MovieDetatilsStateImplCopyWithImpl<$Res>
    extends _$MovieDetailsStateCopyWithImpl<$Res, _$MovieDetatilsStateImpl>
    implements _$$MovieDetatilsStateImplCopyWith<$Res> {
  __$$MovieDetatilsStateImplCopyWithImpl(_$MovieDetatilsStateImpl _value,
      $Res Function(_$MovieDetatilsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? movie = freezed,
  }) {
    return _then(_$MovieDetatilsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      movie: freezed == movie
          ? _value.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as Movie?,
    ));
  }
}

/// @nodoc

class _$MovieDetatilsStateImpl implements _MovieDetatilsState {
  const _$MovieDetatilsStateImpl(
      {required this.isLoading, required this.isError, this.movie});

  @override
  final bool isLoading;
  @override
  final bool isError;
  @override
  final Movie? movie;

  @override
  String toString() {
    return 'MovieDetailsState(isLoading: $isLoading, isError: $isError, movie: $movie)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieDetatilsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.movie, movie) || other.movie == movie));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isError, movie);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieDetatilsStateImplCopyWith<_$MovieDetatilsStateImpl> get copyWith =>
      __$$MovieDetatilsStateImplCopyWithImpl<_$MovieDetatilsStateImpl>(
          this, _$identity);
}

abstract class _MovieDetatilsState implements MovieDetailsState {
  const factory _MovieDetatilsState(
      {required final bool isLoading,
      required final bool isError,
      final Movie? movie}) = _$MovieDetatilsStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  Movie? get movie;
  @override
  @JsonKey(ignore: true)
  _$$MovieDetatilsStateImplCopyWith<_$MovieDetatilsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
