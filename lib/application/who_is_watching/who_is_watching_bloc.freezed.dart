// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'who_is_watching_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WhoIsWatchingEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Profile profile) setProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Profile profile)? setProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Profile profile)? setProfile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SetProfile value) setProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SetProfile value)? setProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SetProfile value)? setProfile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WhoIsWatchingEventCopyWith<$Res> {
  factory $WhoIsWatchingEventCopyWith(
          WhoIsWatchingEvent value, $Res Function(WhoIsWatchingEvent) then) =
      _$WhoIsWatchingEventCopyWithImpl<$Res, WhoIsWatchingEvent>;
}

/// @nodoc
class _$WhoIsWatchingEventCopyWithImpl<$Res, $Val extends WhoIsWatchingEvent>
    implements $WhoIsWatchingEventCopyWith<$Res> {
  _$WhoIsWatchingEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$WhoIsWatchingEventCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'WhoIsWatchingEvent.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Profile profile) setProfile,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Profile profile)? setProfile,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Profile profile)? setProfile,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SetProfile value) setProfile,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SetProfile value)? setProfile,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SetProfile value)? setProfile,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements WhoIsWatchingEvent {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$SetProfileImplCopyWith<$Res> {
  factory _$$SetProfileImplCopyWith(
          _$SetProfileImpl value, $Res Function(_$SetProfileImpl) then) =
      __$$SetProfileImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Profile profile});
}

/// @nodoc
class __$$SetProfileImplCopyWithImpl<$Res>
    extends _$WhoIsWatchingEventCopyWithImpl<$Res, _$SetProfileImpl>
    implements _$$SetProfileImplCopyWith<$Res> {
  __$$SetProfileImplCopyWithImpl(
      _$SetProfileImpl _value, $Res Function(_$SetProfileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
  }) {
    return _then(_$SetProfileImpl(
      null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
    ));
  }
}

/// @nodoc

class _$SetProfileImpl implements _SetProfile {
  const _$SetProfileImpl(this.profile);

  @override
  final Profile profile;

  @override
  String toString() {
    return 'WhoIsWatchingEvent.setProfile(profile: $profile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetProfileImpl &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetProfileImplCopyWith<_$SetProfileImpl> get copyWith =>
      __$$SetProfileImplCopyWithImpl<_$SetProfileImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Profile profile) setProfile,
  }) {
    return setProfile(profile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Profile profile)? setProfile,
  }) {
    return setProfile?.call(profile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Profile profile)? setProfile,
    required TResult orElse(),
  }) {
    if (setProfile != null) {
      return setProfile(profile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SetProfile value) setProfile,
  }) {
    return setProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SetProfile value)? setProfile,
  }) {
    return setProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SetProfile value)? setProfile,
    required TResult orElse(),
  }) {
    if (setProfile != null) {
      return setProfile(this);
    }
    return orElse();
  }
}

abstract class _SetProfile implements WhoIsWatchingEvent {
  const factory _SetProfile(final Profile profile) = _$SetProfileImpl;

  Profile get profile;
  @JsonKey(ignore: true)
  _$$SetProfileImplCopyWith<_$SetProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$WhoIsWatchingState {
  List<Profile> get profiles => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WhoIsWatchingStateCopyWith<WhoIsWatchingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WhoIsWatchingStateCopyWith<$Res> {
  factory $WhoIsWatchingStateCopyWith(
          WhoIsWatchingState value, $Res Function(WhoIsWatchingState) then) =
      _$WhoIsWatchingStateCopyWithImpl<$Res, WhoIsWatchingState>;
  @useResult
  $Res call({List<Profile> profiles});
}

/// @nodoc
class _$WhoIsWatchingStateCopyWithImpl<$Res, $Val extends WhoIsWatchingState>
    implements $WhoIsWatchingStateCopyWith<$Res> {
  _$WhoIsWatchingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profiles = null,
  }) {
    return _then(_value.copyWith(
      profiles: null == profiles
          ? _value.profiles
          : profiles // ignore: cast_nullable_to_non_nullable
              as List<Profile>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WhoIsWatchingImplCopyWith<$Res>
    implements $WhoIsWatchingStateCopyWith<$Res> {
  factory _$$WhoIsWatchingImplCopyWith(
          _$WhoIsWatchingImpl value, $Res Function(_$WhoIsWatchingImpl) then) =
      __$$WhoIsWatchingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Profile> profiles});
}

/// @nodoc
class __$$WhoIsWatchingImplCopyWithImpl<$Res>
    extends _$WhoIsWatchingStateCopyWithImpl<$Res, _$WhoIsWatchingImpl>
    implements _$$WhoIsWatchingImplCopyWith<$Res> {
  __$$WhoIsWatchingImplCopyWithImpl(
      _$WhoIsWatchingImpl _value, $Res Function(_$WhoIsWatchingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profiles = null,
  }) {
    return _then(_$WhoIsWatchingImpl(
      profiles: null == profiles
          ? _value._profiles
          : profiles // ignore: cast_nullable_to_non_nullable
              as List<Profile>,
    ));
  }
}

/// @nodoc

class _$WhoIsWatchingImpl implements _WhoIsWatching {
  const _$WhoIsWatchingImpl({required final List<Profile> profiles})
      : _profiles = profiles;

  final List<Profile> _profiles;
  @override
  List<Profile> get profiles {
    if (_profiles is EqualUnmodifiableListView) return _profiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_profiles);
  }

  @override
  String toString() {
    return 'WhoIsWatchingState(profiles: $profiles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WhoIsWatchingImpl &&
            const DeepCollectionEquality().equals(other._profiles, _profiles));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_profiles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WhoIsWatchingImplCopyWith<_$WhoIsWatchingImpl> get copyWith =>
      __$$WhoIsWatchingImplCopyWithImpl<_$WhoIsWatchingImpl>(this, _$identity);
}

abstract class _WhoIsWatching implements WhoIsWatchingState {
  const factory _WhoIsWatching({required final List<Profile> profiles}) =
      _$WhoIsWatchingImpl;

  @override
  List<Profile> get profiles;
  @override
  @JsonKey(ignore: true)
  _$$WhoIsWatchingImplCopyWith<_$WhoIsWatchingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
