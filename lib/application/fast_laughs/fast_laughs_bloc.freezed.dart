// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fast_laughs_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FastLaughsEvent {
  int get page => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page) getVideos,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page)? getVideos,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page)? getVideos,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetVideos value) getVideos,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetVideos value)? getVideos,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetVideos value)? getVideos,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FastLaughsEventCopyWith<FastLaughsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FastLaughsEventCopyWith<$Res> {
  factory $FastLaughsEventCopyWith(
          FastLaughsEvent value, $Res Function(FastLaughsEvent) then) =
      _$FastLaughsEventCopyWithImpl<$Res, FastLaughsEvent>;
  @useResult
  $Res call({int page});
}

/// @nodoc
class _$FastLaughsEventCopyWithImpl<$Res, $Val extends FastLaughsEvent>
    implements $FastLaughsEventCopyWith<$Res> {
  _$FastLaughsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetVideosImplCopyWith<$Res>
    implements $FastLaughsEventCopyWith<$Res> {
  factory _$$GetVideosImplCopyWith(
          _$GetVideosImpl value, $Res Function(_$GetVideosImpl) then) =
      __$$GetVideosImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page});
}

/// @nodoc
class __$$GetVideosImplCopyWithImpl<$Res>
    extends _$FastLaughsEventCopyWithImpl<$Res, _$GetVideosImpl>
    implements _$$GetVideosImplCopyWith<$Res> {
  __$$GetVideosImplCopyWithImpl(
      _$GetVideosImpl _value, $Res Function(_$GetVideosImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
  }) {
    return _then(_$GetVideosImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetVideosImpl implements _GetVideos {
  const _$GetVideosImpl({required this.page});

  @override
  final int page;

  @override
  String toString() {
    return 'FastLaughsEvent.getVideos(page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetVideosImpl &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetVideosImplCopyWith<_$GetVideosImpl> get copyWith =>
      __$$GetVideosImplCopyWithImpl<_$GetVideosImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page) getVideos,
  }) {
    return getVideos(page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page)? getVideos,
  }) {
    return getVideos?.call(page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page)? getVideos,
    required TResult orElse(),
  }) {
    if (getVideos != null) {
      return getVideos(page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetVideos value) getVideos,
  }) {
    return getVideos(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetVideos value)? getVideos,
  }) {
    return getVideos?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetVideos value)? getVideos,
    required TResult orElse(),
  }) {
    if (getVideos != null) {
      return getVideos(this);
    }
    return orElse();
  }
}

abstract class _GetVideos implements FastLaughsEvent {
  const factory _GetVideos({required final int page}) = _$GetVideosImpl;

  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$$GetVideosImplCopyWith<_$GetVideosImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FastLaughsState {
  bool? get isError => throw _privateConstructorUsedError;
  List<FastLaughsVideo>? get videos => throw _privateConstructorUsedError;
  int? get nextPage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FastLaughsStateCopyWith<FastLaughsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FastLaughsStateCopyWith<$Res> {
  factory $FastLaughsStateCopyWith(
          FastLaughsState value, $Res Function(FastLaughsState) then) =
      _$FastLaughsStateCopyWithImpl<$Res, FastLaughsState>;
  @useResult
  $Res call({bool? isError, List<FastLaughsVideo>? videos, int? nextPage});
}

/// @nodoc
class _$FastLaughsStateCopyWithImpl<$Res, $Val extends FastLaughsState>
    implements $FastLaughsStateCopyWith<$Res> {
  _$FastLaughsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isError = freezed,
    Object? videos = freezed,
    Object? nextPage = freezed,
  }) {
    return _then(_value.copyWith(
      isError: freezed == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool?,
      videos: freezed == videos
          ? _value.videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<FastLaughsVideo>?,
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FastLaughsImplCopyWith<$Res>
    implements $FastLaughsStateCopyWith<$Res> {
  factory _$$FastLaughsImplCopyWith(
          _$FastLaughsImpl value, $Res Function(_$FastLaughsImpl) then) =
      __$$FastLaughsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? isError, List<FastLaughsVideo>? videos, int? nextPage});
}

/// @nodoc
class __$$FastLaughsImplCopyWithImpl<$Res>
    extends _$FastLaughsStateCopyWithImpl<$Res, _$FastLaughsImpl>
    implements _$$FastLaughsImplCopyWith<$Res> {
  __$$FastLaughsImplCopyWithImpl(
      _$FastLaughsImpl _value, $Res Function(_$FastLaughsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isError = freezed,
    Object? videos = freezed,
    Object? nextPage = freezed,
  }) {
    return _then(_$FastLaughsImpl(
      isError: freezed == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool?,
      videos: freezed == videos
          ? _value._videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<FastLaughsVideo>?,
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$FastLaughsImpl implements _FastLaughs {
  const _$FastLaughsImpl(
      {this.isError, final List<FastLaughsVideo>? videos, this.nextPage})
      : _videos = videos;

  @override
  final bool? isError;
  final List<FastLaughsVideo>? _videos;
  @override
  List<FastLaughsVideo>? get videos {
    final value = _videos;
    if (value == null) return null;
    if (_videos is EqualUnmodifiableListView) return _videos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? nextPage;

  @override
  String toString() {
    return 'FastLaughsState(isError: $isError, videos: $videos, nextPage: $nextPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FastLaughsImpl &&
            (identical(other.isError, isError) || other.isError == isError) &&
            const DeepCollectionEquality().equals(other._videos, _videos) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isError,
      const DeepCollectionEquality().hash(_videos), nextPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FastLaughsImplCopyWith<_$FastLaughsImpl> get copyWith =>
      __$$FastLaughsImplCopyWithImpl<_$FastLaughsImpl>(this, _$identity);
}

abstract class _FastLaughs implements FastLaughsState {
  const factory _FastLaughs(
      {final bool? isError,
      final List<FastLaughsVideo>? videos,
      final int? nextPage}) = _$FastLaughsImpl;

  @override
  bool? get isError;
  @override
  List<FastLaughsVideo>? get videos;
  @override
  int? get nextPage;
  @override
  @JsonKey(ignore: true)
  _$$FastLaughsImplCopyWith<_$FastLaughsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
