// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SettingsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getSettings,
    required TResult Function(bool isExplicitAllowed) saveSettings,
    required TResult Function() logOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getSettings,
    TResult? Function(bool isExplicitAllowed)? saveSettings,
    TResult? Function()? logOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSettings,
    TResult Function(bool isExplicitAllowed)? saveSettings,
    TResult Function()? logOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSettings value) getSettings,
    required TResult Function(_SaveSettings value) saveSettings,
    required TResult Function(_LogOut value) logOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSettings value)? getSettings,
    TResult? Function(_SaveSettings value)? saveSettings,
    TResult? Function(_LogOut value)? logOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSettings value)? getSettings,
    TResult Function(_SaveSettings value)? saveSettings,
    TResult Function(_LogOut value)? logOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsEventCopyWith<$Res> {
  factory $SettingsEventCopyWith(
          SettingsEvent value, $Res Function(SettingsEvent) then) =
      _$SettingsEventCopyWithImpl<$Res, SettingsEvent>;
}

/// @nodoc
class _$SettingsEventCopyWithImpl<$Res, $Val extends SettingsEvent>
    implements $SettingsEventCopyWith<$Res> {
  _$SettingsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetSettingsImplCopyWith<$Res> {
  factory _$$GetSettingsImplCopyWith(
          _$GetSettingsImpl value, $Res Function(_$GetSettingsImpl) then) =
      __$$GetSettingsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetSettingsImplCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res, _$GetSettingsImpl>
    implements _$$GetSettingsImplCopyWith<$Res> {
  __$$GetSettingsImplCopyWithImpl(
      _$GetSettingsImpl _value, $Res Function(_$GetSettingsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetSettingsImpl implements _GetSettings {
  const _$GetSettingsImpl();

  @override
  String toString() {
    return 'SettingsEvent.getSettings()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetSettingsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getSettings,
    required TResult Function(bool isExplicitAllowed) saveSettings,
    required TResult Function() logOut,
  }) {
    return getSettings();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getSettings,
    TResult? Function(bool isExplicitAllowed)? saveSettings,
    TResult? Function()? logOut,
  }) {
    return getSettings?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSettings,
    TResult Function(bool isExplicitAllowed)? saveSettings,
    TResult Function()? logOut,
    required TResult orElse(),
  }) {
    if (getSettings != null) {
      return getSettings();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSettings value) getSettings,
    required TResult Function(_SaveSettings value) saveSettings,
    required TResult Function(_LogOut value) logOut,
  }) {
    return getSettings(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSettings value)? getSettings,
    TResult? Function(_SaveSettings value)? saveSettings,
    TResult? Function(_LogOut value)? logOut,
  }) {
    return getSettings?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSettings value)? getSettings,
    TResult Function(_SaveSettings value)? saveSettings,
    TResult Function(_LogOut value)? logOut,
    required TResult orElse(),
  }) {
    if (getSettings != null) {
      return getSettings(this);
    }
    return orElse();
  }
}

abstract class _GetSettings implements SettingsEvent {
  const factory _GetSettings() = _$GetSettingsImpl;
}

/// @nodoc
abstract class _$$SaveSettingsImplCopyWith<$Res> {
  factory _$$SaveSettingsImplCopyWith(
          _$SaveSettingsImpl value, $Res Function(_$SaveSettingsImpl) then) =
      __$$SaveSettingsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isExplicitAllowed});
}

/// @nodoc
class __$$SaveSettingsImplCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res, _$SaveSettingsImpl>
    implements _$$SaveSettingsImplCopyWith<$Res> {
  __$$SaveSettingsImplCopyWithImpl(
      _$SaveSettingsImpl _value, $Res Function(_$SaveSettingsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isExplicitAllowed = null,
  }) {
    return _then(_$SaveSettingsImpl(
      isExplicitAllowed: null == isExplicitAllowed
          ? _value.isExplicitAllowed
          : isExplicitAllowed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SaveSettingsImpl implements _SaveSettings {
  const _$SaveSettingsImpl({required this.isExplicitAllowed});

  @override
  final bool isExplicitAllowed;

  @override
  String toString() {
    return 'SettingsEvent.saveSettings(isExplicitAllowed: $isExplicitAllowed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveSettingsImpl &&
            (identical(other.isExplicitAllowed, isExplicitAllowed) ||
                other.isExplicitAllowed == isExplicitAllowed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isExplicitAllowed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveSettingsImplCopyWith<_$SaveSettingsImpl> get copyWith =>
      __$$SaveSettingsImplCopyWithImpl<_$SaveSettingsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getSettings,
    required TResult Function(bool isExplicitAllowed) saveSettings,
    required TResult Function() logOut,
  }) {
    return saveSettings(isExplicitAllowed);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getSettings,
    TResult? Function(bool isExplicitAllowed)? saveSettings,
    TResult? Function()? logOut,
  }) {
    return saveSettings?.call(isExplicitAllowed);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSettings,
    TResult Function(bool isExplicitAllowed)? saveSettings,
    TResult Function()? logOut,
    required TResult orElse(),
  }) {
    if (saveSettings != null) {
      return saveSettings(isExplicitAllowed);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSettings value) getSettings,
    required TResult Function(_SaveSettings value) saveSettings,
    required TResult Function(_LogOut value) logOut,
  }) {
    return saveSettings(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSettings value)? getSettings,
    TResult? Function(_SaveSettings value)? saveSettings,
    TResult? Function(_LogOut value)? logOut,
  }) {
    return saveSettings?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSettings value)? getSettings,
    TResult Function(_SaveSettings value)? saveSettings,
    TResult Function(_LogOut value)? logOut,
    required TResult orElse(),
  }) {
    if (saveSettings != null) {
      return saveSettings(this);
    }
    return orElse();
  }
}

abstract class _SaveSettings implements SettingsEvent {
  const factory _SaveSettings({required final bool isExplicitAllowed}) =
      _$SaveSettingsImpl;

  bool get isExplicitAllowed;
  @JsonKey(ignore: true)
  _$$SaveSettingsImplCopyWith<_$SaveSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LogOutImplCopyWith<$Res> {
  factory _$$LogOutImplCopyWith(
          _$LogOutImpl value, $Res Function(_$LogOutImpl) then) =
      __$$LogOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogOutImplCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res, _$LogOutImpl>
    implements _$$LogOutImplCopyWith<$Res> {
  __$$LogOutImplCopyWithImpl(
      _$LogOutImpl _value, $Res Function(_$LogOutImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LogOutImpl implements _LogOut {
  const _$LogOutImpl();

  @override
  String toString() {
    return 'SettingsEvent.logOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogOutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getSettings,
    required TResult Function(bool isExplicitAllowed) saveSettings,
    required TResult Function() logOut,
  }) {
    return logOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getSettings,
    TResult? Function(bool isExplicitAllowed)? saveSettings,
    TResult? Function()? logOut,
  }) {
    return logOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSettings,
    TResult Function(bool isExplicitAllowed)? saveSettings,
    TResult Function()? logOut,
    required TResult orElse(),
  }) {
    if (logOut != null) {
      return logOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSettings value) getSettings,
    required TResult Function(_SaveSettings value) saveSettings,
    required TResult Function(_LogOut value) logOut,
  }) {
    return logOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSettings value)? getSettings,
    TResult? Function(_SaveSettings value)? saveSettings,
    TResult? Function(_LogOut value)? logOut,
  }) {
    return logOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSettings value)? getSettings,
    TResult Function(_SaveSettings value)? saveSettings,
    TResult Function(_LogOut value)? logOut,
    required TResult orElse(),
  }) {
    if (logOut != null) {
      return logOut(this);
    }
    return orElse();
  }
}

abstract class _LogOut implements SettingsEvent {
  const factory _LogOut() = _$LogOutImpl;
}

/// @nodoc
mixin _$SettingsState {
  String get name => throw _privateConstructorUsedError;
  bool get isExplicitAllowed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingsStateCopyWith<SettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
          SettingsState value, $Res Function(SettingsState) then) =
      _$SettingsStateCopyWithImpl<$Res, SettingsState>;
  @useResult
  $Res call({String name, bool isExplicitAllowed});
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res, $Val extends SettingsState>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? isExplicitAllowed = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isExplicitAllowed: null == isExplicitAllowed
          ? _value.isExplicitAllowed
          : isExplicitAllowed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SettingsStateImplCopyWith<$Res>
    implements $SettingsStateCopyWith<$Res> {
  factory _$$SettingsStateImplCopyWith(
          _$SettingsStateImpl value, $Res Function(_$SettingsStateImpl) then) =
      __$$SettingsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, bool isExplicitAllowed});
}

/// @nodoc
class __$$SettingsStateImplCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$SettingsStateImpl>
    implements _$$SettingsStateImplCopyWith<$Res> {
  __$$SettingsStateImplCopyWithImpl(
      _$SettingsStateImpl _value, $Res Function(_$SettingsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? isExplicitAllowed = null,
  }) {
    return _then(_$SettingsStateImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isExplicitAllowed: null == isExplicitAllowed
          ? _value.isExplicitAllowed
          : isExplicitAllowed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SettingsStateImpl implements _SettingsState {
  const _$SettingsStateImpl(
      {required this.name, required this.isExplicitAllowed});

  @override
  final String name;
  @override
  final bool isExplicitAllowed;

  @override
  String toString() {
    return 'SettingsState(name: $name, isExplicitAllowed: $isExplicitAllowed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsStateImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isExplicitAllowed, isExplicitAllowed) ||
                other.isExplicitAllowed == isExplicitAllowed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, isExplicitAllowed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsStateImplCopyWith<_$SettingsStateImpl> get copyWith =>
      __$$SettingsStateImplCopyWithImpl<_$SettingsStateImpl>(this, _$identity);
}

abstract class _SettingsState implements SettingsState {
  const factory _SettingsState(
      {required final String name,
      required final bool isExplicitAllowed}) = _$SettingsStateImpl;

  @override
  String get name;
  @override
  bool get isExplicitAllowed;
  @override
  @JsonKey(ignore: true)
  _$$SettingsStateImplCopyWith<_$SettingsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
